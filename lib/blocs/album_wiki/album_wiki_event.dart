part of 'album_wiki_bloc.dart';

@immutable
abstract class AlbumWikiEvent {}

class AlbumWikiInfoRequested extends AlbumWikiEvent {
  final String artist;
  final String album;
  AlbumWikiInfoRequested({required this.artist, required this.album});
}
