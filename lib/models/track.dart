import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/album_of_a_track.dart';
import 'package:justthelyrics/models/artist_info.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';

part 'track.g.dart';
abstract class Track implements Built<Track, TrackBuilder> {

  String? get id;
  AlbumOfTheTrack? get albumOfTrack;
  String? get name;
  String? get artistName;
  ArtistInfo? get artist;
  String? get lyric;

  Track._();
  factory Track([void Function(TrackBuilder) updates]) = _$Track;

  Object? toJson() {
    return serializers.serializeWith(Track.serializer, this);
  }

  static Track? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Track.serializer, json);
  }

  static Serializer<Track> get serializer => _$trackSerializer;
}
