import 'package:serverpod/serverpod.dart';
import 'package:shikai_server/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

Future<int> getLastPage(Session session) async {
  final Uri uri = Uri.parse('${url}subbed-anime');

  final http.Response response = await http.get(uri);

  dom.Document html = dom.Document.html(response.body);

  final lastPage = html.querySelectorAll('.pagination .page-item .page-link').last.attributes['href']!.split('=').last;

  return int.parse(lastPage);
}
