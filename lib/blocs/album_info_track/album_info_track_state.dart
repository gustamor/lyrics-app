part of 'album_info_track_bloc.dart';

@immutable
abstract class AlbumTracksState {}

class AlbumInfoInitial extends AlbumTracksState {}

class AlbumInfoTrackFetched extends AlbumTracksState {
  final AlbumTracks album;

  AlbumInfoTrackFetched({required this.album});
}

class AlbumInfoError extends AlbumTracksState {
  final String error;

  AlbumInfoError({required this.error});
}
