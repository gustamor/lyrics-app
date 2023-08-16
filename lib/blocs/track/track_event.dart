part of 'track_bloc.dart';

@immutable
abstract class TrackEvent {}
class AlbumListOfTrackRequested extends TrackEvent {
  final Track track;

  AlbumListOfTrackRequested({required this.track});
}