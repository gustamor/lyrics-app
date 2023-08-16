import 'package:bloc/bloc.dart';
import 'package:justthelyrics/models/album_of_a_track.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:meta/meta.dart';

part 'track_event.dart';
part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc() : super(TrackInitial()) {
    /* Future<void> _getAlbumInfo(
        String artist, albumName, Emitter<AlbumInfoState> emit) async {
      try {
        AlbumInfo? _tracks = await api.fetchAlbumTracks(artist, albumName);
        emit(AlbumInfoFetched(album: _tracks!));
      } catch (e) {
        emit(AlbumInfoError(error: e.toString()));
      }
    }
 */
    on<AlbumListOfTrackRequested>((event, emit) async {});
  }
}
