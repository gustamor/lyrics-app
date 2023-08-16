part of 'album_info_track_bloc.dart';

@immutable
abstract class AlbumTracksEvent {}

class AlbumInfoTrackRequested extends AlbumTracksEvent {
  final String artist;
  final String album;

  AlbumInfoTrackRequested({required this.artist, required this.album});
}
