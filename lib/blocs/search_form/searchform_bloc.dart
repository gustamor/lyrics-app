import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justthelyrics/blocs/search_form/searchform_event.dart';
import 'package:justthelyrics/blocs/search_form/searchform_state.dart';

import 'package:justthelyrics/services/repositories/track_search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    Future<void> _showResult(String text, Emitter<SearchState> emit) async {
      if (text.isNotEmpty) {
        final api = TrackSearchRepository();
        final search = await api.fetchTrackOVhSearchResults(text);
        if (search == null) emit(SearchInitial());
        try {
          if (search!.data!.isNotEmpty) {
            if (search.data![0].name != null) emit(SearchResult(search));
          } else {
            emit(SearchInitial());
          }
        } catch (e) {
          emit(SearchInitial());
        }
      }
    }

    void _fieldEmpty(String text, Emitter<SearchState> emit) async {
      if (text.isEmpty) {
        emit(StartState());
      }
    }

    on<KeyPressed>((event, emit) => _showResult(event.key, emit));
    on<SearchInitialized>((event, emit) => SearchInitial());
    on<CharDeleted>((event, emit) => _fieldEmpty(event.text, emit));
  }
}
