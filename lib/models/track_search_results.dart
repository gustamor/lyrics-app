import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/track_from_search.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';

part 'track_search_results.g.dart';

abstract class TrackSearchResult
    implements Built<TrackSearchResult, TrackSearchResultBuilder> {
  BuiltList<TrackSearch>? get track;

  TrackSearchResult._();
  factory TrackSearchResult([void Function(TrackSearchResultBuilder) updates]) =
      _$TrackSearchResult;

  Object? toJson() {
    return serializers.serializeWith(TrackSearchResult.serializer, this);
  }

  static TrackSearchResult? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TrackSearchResult.serializer, json);
  }

  static Serializer<TrackSearchResult> get serializer =>
      _$trackSearchResultSerializer;
}
