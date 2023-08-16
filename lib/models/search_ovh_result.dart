import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';
import 'package:justthelyrics/models/track_ovh_search.dart';

part 'search_ovh_result.g.dart';

abstract class TrackOvhSearchResult
    implements Built<TrackOvhSearchResult, TrackOvhSearchResultBuilder> {
  BuiltList<TrackOvhSearch>? get data;

  TrackOvhSearchResult._();
  factory TrackOvhSearchResult(
          [void Function(TrackOvhSearchResultBuilder) updates]) =
      _$TrackOvhSearchResult;

  Object? toJson() {
    return serializers.serializeWith(TrackOvhSearchResult.serializer, this);
  }

  static TrackOvhSearchResult? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TrackOvhSearchResult.serializer, json);
  }

  static Serializer<TrackOvhSearchResult> get serializer =>
      _$trackOvhSearchResultSerializer;
}
