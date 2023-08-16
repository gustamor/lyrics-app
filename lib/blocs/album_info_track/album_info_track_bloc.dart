import 'package:bloc/bloc.dart';
import 'package:justthelyrics/models/album_info.dart';

import 'package:justthelyrics/services/repositories/album_repository.dart';
import 'package:meta/meta.dart';

part 'album_info_track_event.dart';
part 'album_info_track_state.dart';

class AlbumTracksBloc extends Bloc<AlbumTracksEvent, AlbumTracksState> {
  AlbumTracksBloc() : super(AlbumInfoInitial()) {
    final AlbumTracksRepository api = AlbumTracksRepository();

    Future<void> _getTracksAlbumInfo(
        String artist, albumName, Emitter<AlbumTracksState> emit) async {
      try {
        AlbumTracks? _tracks = await api.fetchAlbumTracks(artist, albumName);
        emit(AlbumInfoTrackFetched(album: _tracks!));
      } catch (e) {
        emit(AlbumInfoError(error: e.toString()));
      }
    }

    on<AlbumInfoTrackRequested>((event, emit) async {
      await _getTracksAlbumInfo(event.artist, event.album, emit);
    });
  }
}
