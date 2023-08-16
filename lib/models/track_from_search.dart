import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/album_topalbums.dart';

import 'package:justthelyrics/models/serializers/serializers.dart';

part 'track_from_search.g.dart';

abstract class TrackSearch implements Built<TrackSearch, TrackSearchBuilder> {
  String? get mbid;
  String? get artist;
  String? get name;
  TopAlbumInfo? get album;
  bool? get lyricFound;

  TrackSearch._();
  factory TrackSearch([void Function(TrackSearchBuilder) updates]) =
      _$TrackSearch;

  Object? toJson() {
    return serializers.serializeWith(TrackSearch.serializer, this);
  }

  static TrackSearch? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TrackSearch.serializer, json);
  }

  static Serializer<TrackSearch> get serializer => _$trackSearchSerializer;
}
