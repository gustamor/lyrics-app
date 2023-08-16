import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/album_topalbums.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';

part 'artist_topalbums.g.dart';

abstract class TopAlbums implements Built<TopAlbums, TopAlbumsBuilder> {
  //Clase de lista de albums
  BuiltList<TopAlbumInfo>? get album;
  TopAlbums._();
  factory TopAlbums([void Function(TopAlbumsBuilder) updates]) = _$TopAlbums;

  Object? toJson() {
    return serializers.serializeWith(TopAlbums.serializer, this);
  }

  static TopAlbums? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TopAlbums.serializer, json);
  }

  static Serializer<TopAlbums> get serializer => _$topAlbumsSerializer;
}
