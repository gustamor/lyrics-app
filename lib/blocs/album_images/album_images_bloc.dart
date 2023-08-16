import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:justthelyrics/models/album_images.dart';
import 'package:justthelyrics/models/image.dart';
import 'package:justthelyrics/services/repositories/album_repository.dart';
import 'package:meta/meta.dart';

part 'album_images_event.dart';
part 'album_images_state.dart';

class AlbumImagesBloc extends Bloc<AlbumImagesEvent, AlbumImagesState> {
  AlbumImagesBloc() : super(AlbumImagesInitial()) 
  {
    final AlbumTracksRepository api = AlbumTracksRepository();

    Future<void> _getImagesAlbumInfo(
        String artist, albumName, Emitter<AlbumImagesState> emit) async {
      try {
        AlbumImages? _tracks = await api.fetchAlbumImages(artist, albumName);
        BuiltList<Image> _images = _tracks!.image;
        emit(AlbumImagesFetched(images: _images));
        _images = BuiltList<Image> ();
      } catch (e) {
        emit(AlbumImagesError(error: e.toString()));
      }
    }

    on<ImagesOfAlbumRequested>((event, emit) async {
      event.artist != null
          ? await _getImagesAlbumInfo(event.artist!, event.album, emit)
          : emit(AlbumImagesInitial());
    });

    on<ToInitialStateRequested>((event, emit) {
      emit(AlbumImagesInitial());
    });
  }
}
