/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:shikai_client/src/protocol/anime.dart' as _i3;
import 'dart:io' as _i4;
import 'protocol.dart' as _i5;

class _EndpointAnime extends _i1.EndpointRef {
  _EndpointAnime(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'anime';

  /// Return top searches of the day
  _i2.Future<List<String>> getTopSearches() =>
      caller.callServerEndpoint<List<String>>(
        'anime',
        'getTopSearches',
        {},
      );

  /// Return complete anime list
  _i2.Future<List<_i3.Anime>> getAllSubbedAnime() =>
      caller.callServerEndpoint<List<_i3.Anime>>(
        'anime',
        'getAllSubbedAnime',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i4.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i5.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    anime = _EndpointAnime(this);
  }

  late final _EndpointAnime anime;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'anime': anime};
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
