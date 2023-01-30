/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/anime.dart' as _i2;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'anime': _i2.AnimeEndpoint()
        ..initialize(
          server,
          'anime',
          null,
        )
    };
    connectors['anime'] = _i1.EndpointConnector(
      name: 'anime',
      endpoint: endpoints['anime']!,
      methodConnectors: {
        'getTopSearches': _i1.MethodConnector(
          name: 'getTopSearches',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['anime'] as _i2.AnimeEndpoint).getTopSearches(session),
        ),
        'getAllSubbedAnime': _i1.MethodConnector(
          name: 'getAllSubbedAnime',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['anime'] as _i2.AnimeEndpoint)
                  .getAllSubbedAnime(session),
        ),
      },
    );
  }
}
