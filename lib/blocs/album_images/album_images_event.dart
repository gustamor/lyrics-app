part of 'album_images_bloc.dart';

@immutable
abstract class AlbumImagesEvent {}

class ImagesOfAlbumRequested extends AlbumImagesEvent {
  final String? artist;
  final String? album;

  ImagesOfAlbumRequested({required this.artist, required this.album});
}

class ToInitialStateRequested extends AlbumImagesEvent {}
