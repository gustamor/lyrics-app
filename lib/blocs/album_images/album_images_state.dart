part of 'album_images_bloc.dart';

@immutable
abstract class AlbumImagesState {}

class AlbumImagesInitial extends AlbumImagesState {
  AlbumImagesInitial();
}

class AlbumImagesFetched extends AlbumImagesState {
  final BuiltList<Image> images;
  AlbumImagesFetched({required this.images});
}

class AlbumImagesError extends AlbumImagesState {
  final String error;
  AlbumImagesError({required this.error});
}
