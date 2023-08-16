import 'package:bloc/bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferredstored_event.dart';
part 'preferredstored_state.dart';

class PreferredstoredBloc
    extends Bloc<PreferredstoredEvent, PreferredstoredState> {
  PreferredstoredBloc() : super(PreferredstoredInitial()) {
    on<PreferredstoredEvent>((event, emit) {});

    on<PreferredStoredChanged>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        if (event.id == true) {
          prefs.setBool(kPREFERREDSTORED, true);
          emit(PreferredStoredOn());
        } else {
          prefs.setBool(kPREFERREDSTORED, false);
          emit(PreferredStoredOff());
        }
     
      } catch (e) {
        prefs.setBool(kPREFERREDSTORED, false);
        emit(PreferredStoredOff());
      }
    });

    Future<void> _getPreferredStoredState(
        Emitter<PreferredstoredState> emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        final _preferStored = prefs.getBool(kPREFERREDSTORED) ?? false;
        if (_preferStored == true) {
          emit(PreferredStoredOn());
        } else {
          emit(PreferredStoredOff());
        }
      } catch (e) {
        emit(PreferredStoredOff());
      }
    }

    on<PreferredStoredRequested>((event, emit) {
      _getPreferredStoredState(emit);
    });
  }
}
