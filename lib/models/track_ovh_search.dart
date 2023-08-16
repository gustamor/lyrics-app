import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/album_ovh.dart';
import 'package:justthelyrics/models/artist_info.dart';

import 'package:justthelyrics/models/serializers/serializers.dart';

part 'track_ovh_search.g.dart';

abstract class TrackOvhSearch
    implements Built<TrackOvhSearch, TrackOvhSearchBuilder> {
  // @BuiltValueField(wireName: r'#id')
  // String? get mbid;
  int? get id;
  @BuiltValueField(wireName: 'title_short')
  String? get name;
  ArtistInfo? get artist;
  AlbumOvhInfo? get album;

  TrackOvhSearch._();
  factory TrackOvhSearch([void Function(TrackOvhSearchBuilder) updates]) =
      _$TrackOvhSearch;

  Object? toJson() {
    return serializers.serializeWith(TrackOvhSearch.serializer, this);
  }

  static TrackOvhSearch? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TrackOvhSearch.serializer, json);
  }

  static Serializer<TrackOvhSearch> get serializer =>
      _$trackOvhSearchSerializer;
}
