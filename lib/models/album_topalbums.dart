import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/artist_info.dart';
import 'package:justthelyrics/models/image.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';

part 'album_topalbums.g.dart';

abstract class TopAlbumInfo
    implements Built<TopAlbumInfo, TopAlbumInfoBuilder> {
  //EL que hay en cada album de la lista
  String? get mbid;
  String? get name;
  ArtistInfo? get artist;
  BuiltList<Image>? get image;

  TopAlbumInfo._();
  factory TopAlbumInfo([void Function(TopAlbumInfoBuilder) updates]) =
      _$TopAlbumInfo;

  Object? toJson() {
    return serializers.serializeWith(TopAlbumInfo.serializer, this);
  }

  static TopAlbumInfo? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TopAlbumInfo.serializer, json);
  }

  static Serializer<TopAlbumInfo> get serializer => _$topAlbumInfoSerializer;
}
