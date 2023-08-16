import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/artist_info.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';

part 'artist_similar.g.dart';

abstract class ArtistSimilar
    implements Built<ArtistSimilar, ArtistSimilarBuilder> {
  BuiltList<ArtistInfo>? get artist;

  ArtistSimilar._();
  factory ArtistSimilar([void Function(ArtistSimilarBuilder) updates]) =
      _$ArtistSimilar;

  Object? toJson() {
    return serializers.serializeWith(ArtistSimilar.serializer, this);
  }

  static ArtistSimilar? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ArtistSimilar.serializer, json);
  }

  static Serializer<ArtistSimilar> get serializer => _$artistSimilarSerializer;
}
