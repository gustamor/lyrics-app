part of 'album_wiki_bloc.dart';

@immutable
abstract class AlbumWikiState {}

class AlbumWikiInitial extends AlbumWikiState {}

class AlbumWikiFetched extends AlbumWikiState {
  final WikiInfo album;
  AlbumWikiFetched({required this.album});
}

class AlbumWikiError extends AlbumWikiState {
  final String error;
  AlbumWikiError({required this.error});
}
