part of 'track_bloc.dart';

@immutable
abstract class TrackState {}

class TrackInitial extends TrackState {}

class AlbumTrackListFetched extends TrackState {
  final AlbumOfTheTrack tracks;

  AlbumTrackListFetched({required this.tracks});
}

class AlbumTrackListError extends TrackState {
  final String error;

  AlbumTrackListError({required this.error});
}
