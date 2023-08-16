import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';


part 'album_ovh.g.dart';

abstract class AlbumOvhInfo
    implements Built<AlbumOvhInfo, AlbumOvhInfoBuilder> {
  int get id;
  String get title;
  String get cover;
  String get cover_small;
  String get cover_medium;
  String get cover_big;
  String get cover_xl;
  String get tracklist;

  AlbumOvhInfo._();
  factory AlbumOvhInfo([void Function(AlbumOvhInfoBuilder)? updates]) =
      _$AlbumOvhInfo;

  Object? toJson() {
    return serializers.serializeWith(AlbumOvhInfo.serializer, this);
  }

  static AlbumOvhInfo? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AlbumOvhInfo.serializer, json);
  }

  static Serializer<AlbumOvhInfo> get serializer => _$albumOvhInfoSerializer;
}
