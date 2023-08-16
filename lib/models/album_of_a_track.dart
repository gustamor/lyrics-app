import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';

part 'album_of_a_track.g.dart';

abstract class AlbumOfTheTrack
    implements Built<AlbumOfTheTrack, AlbumOfTheTrackBuilder> {
  String? get mbid;
  String? get albumId;
  String? get title;
  String? get artist;

  AlbumOfTheTrack._();

  factory AlbumOfTheTrack([void Function(AlbumOfTheTrackBuilder) updates]) =
      _$AlbumOfTheTrack;

  Object? toJson() {
    return serializers.serializeWith(AlbumOfTheTrack.serializer, this);
  }

  static AlbumOfTheTrack? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AlbumOfTheTrack.serializer, json);
  }

  static Serializer<AlbumOfTheTrack> get serializer =>
      _$albumOfTheTrackSerializer;
}
