import 'package:bloc/bloc.dart';
import 'package:justthelyrics/models/wiki_info.dart';
import 'package:justthelyrics/services/repositories/album_repository.dart';
import 'package:meta/meta.dart';

part 'album_wiki_event.dart';
part 'album_wiki_state.dart';

class AlbumWikiBloc extends Bloc<AlbumWikiEvent, AlbumWikiState> {
  AlbumWikiBloc() : super(AlbumWikiInitial()) {
    final AlbumTracksRepository api = AlbumTracksRepository();

    Future<void> _getWikiAlbumInfo(
        String artist, albumName, Emitter<AlbumWikiState> emit) async {
      try {
        WikiInfo? wiki = await api.fetchAlbumWikiInfo(artist, albumName);
        emit(AlbumWikiFetched(album: wiki!));
      } catch (e) {
        emit(AlbumWikiError(error: e.toString()));
      }
    }

    on<AlbumWikiInfoRequested>((event, emit) async {
      await _getWikiAlbumInfo(event.artist, event.album, emit);
    });
  }
}
