import 'package:serverpod/serverpod.dart';
import 'package:shikai_server/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:shikai_server/src/generated/anime.dart';
import 'package:shikai_server/src/helpers/anime.dart';

class AnimeEndpoint extends Endpoint {
  /// Return top searches of the day
  Future<List<String>> getTopSearches(Session session) async {
    final Uri uri = Uri.parse(url);
    final http.Response response = await http.get(uri);

    dom.Document html = dom.Document.html(response.body);

    final searchList = html.querySelectorAll('.mwt-content .home-search .xhashtag > a').map((e) => e.innerHtml).toList();

    return searchList;
  }

  /// Return complete anime list
  Future<List<Anime>> getAllSubbedAnime(Session session) async {
    List<Uri> uris = [];
    int lastPage = await getLastPage(session);

    for (var i = 1; i <= lastPage; i++) {
      uris.add(Uri.parse('${url}subbed-anime?page=$i'));
      session.log('${url}subbed-anime?page=$i');
    }

    List<http.Response> responses = await Future.wait(uris.map((uri) => http.get(uri)));
    List<dom.Document> htmls = responses.map((response) => dom.Document.html(response.body)).toList();
    List<dynamic> domAnimeLists = htmls.map((html) => html.querySelectorAll('.film_list-wrap .flw-item')).toList();

    List<Anime> animeList = [];

    for (var domAnime in domAnimeLists) {
      domAnime.forEach((anime) {
        final String id = anime.querySelector('.film-poster-ahref').attributes['data-id']!;
        final String title = anime.querySelector('.film-name .dynamic-name').innerHtml;
        final String image = anime.querySelector('.film-poster-img').attributes['data-src'];
        final String description =
            anime.querySelector('.film-detail .description') != null ? anime.querySelector('.film-detail .description').innerHtml : '';
        final String type = anime.querySelector('.fd-infor').children[0].innerHtml;
        final String avgDuration = anime.querySelector('.fd-infor').children[2].innerHtml;

        var value = int.tryParse(avgDuration);
        value ??= 0;

        animeList.add(
          Anime(id: int.parse(id), title: title, image: image, description: description, type: type, avgDuration: value),
        );
      });
    }

    animeList.sort((a, b) => a.title!.compareTo(b.title!));
    session.log('Anime total count: ${animeList.length}');

    return animeList;
  }
}
