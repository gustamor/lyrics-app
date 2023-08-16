import 'package:bloc/bloc.dart';
import 'package:justthelyrics/services/API/music_info_api.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:justthelyrics/services/repositories/lyrics_repository.dart';
import 'package:meta/meta.dart';

part 'getlyric_event.dart';
part 'getlyric_state.dart';

class LyricsBloc extends Bloc<GetlyricEvent, GetlyricState> {
  LyricsBloc() : super(GetlyricInitial()) {
    Future<void> _getLyrics(
        
        String artist, String title, Emitter<GetlyricState> emit) async {
      try {
        
        final api = LyricsRepository();
        Track? _lyric = await api.getLyrics(artist: artist, song: title);
        emit(LyricsFetched(track: _lyric));
        _lyric = Track();
      } catch (e) {
        if (e is NoServiceFoundException) {

          emit(LyricsError(error: e.toString()));
        } else {
          emit(LyricsError(error: e.toString()));
        }
      }
    }

    on<TrackLyricsRequested>((event, emit) async {
      await _getLyrics(event.artist, event.title, emit);
    });

    on<ToInitialRequested>((event, emit) => emit(GetlyricInitial()));
  }
}
