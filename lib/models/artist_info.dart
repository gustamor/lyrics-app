import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:justthelyrics/models/serializers/serializers.dart';

part 'artist_info.g.dart';

abstract class ArtistInfo implements Built<ArtistInfo, ArtistInfoBuilder> {
  int? get id;
  String? get name;
  String? get picture;
  String? get picture_small;
  String? get picture_medium;
  String? get picture_big;
  String? get picture_xl;
  String? get tracklist;

  //BuiltList<TracksResponse> get songs;

  ArtistInfo._();
  factory ArtistInfo([void Function(ArtistInfoBuilder) updates]) = _$ArtistInfo;

  Object? toJson() {
    return serializers.serializeWith(ArtistInfo.serializer, this);
  }

  static ArtistInfo? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ArtistInfo.serializer, json);
  }

  static Serializer<ArtistInfo> get serializer => _$artistInfoSerializer;
}
