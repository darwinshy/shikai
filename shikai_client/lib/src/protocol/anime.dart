/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Anime extends _i1.SerializableEntity {
  Anime({
    required this.id,
    this.title,
    this.episodes,
    this.description,
    this.image,
    this.poster,
    this.type,
    this.avgDuration,
  });

  factory Anime.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Anime(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String?>(jsonSerialization['title']),
      episodes:
          serializationManager.deserialize<int?>(jsonSerialization['episodes']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      image:
          serializationManager.deserialize<String?>(jsonSerialization['image']),
      poster: serializationManager
          .deserialize<String?>(jsonSerialization['poster']),
      type:
          serializationManager.deserialize<String?>(jsonSerialization['type']),
      avgDuration: serializationManager
          .deserialize<int?>(jsonSerialization['avgDuration']),
    );
  }

  int id;

  String? title;

  int? episodes;

  String? description;

  String? image;

  String? poster;

  String? type;

  int? avgDuration;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'episodes': episodes,
      'description': description,
      'image': image,
      'poster': poster,
      'type': type,
      'avgDuration': avgDuration,
    };
  }
}
