import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/image.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';
import 'package:justthelyrics/models/track.dart';

import 'wiki_info.dart';

part 'album_info.g.dart';

abstract class AlbumTracks implements Built<AlbumTracks, AlbumTracksBuilder> {
  BuiltList<Track> get track;
  WikiInfo get wiki;
  BuiltList<Image> get images;

  AlbumTracks._();
  factory AlbumTracks([void Function(AlbumTracksBuilder)? updates]) =
      _$AlbumTracks;

  Object? toJson() {
    return serializers.serializeWith(AlbumTracks.serializer, this);
  }

  static AlbumTracks? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AlbumTracks.serializer, json);
  }

  static Serializer<AlbumTracks> get serializer => _$albumTracksSerializer;
}
