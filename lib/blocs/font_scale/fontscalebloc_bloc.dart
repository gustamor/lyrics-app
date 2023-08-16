import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'fontscalebloc_event.dart';
part 'fontscalebloc_state.dart';

class FontScaleBloc extends Bloc<FontScaleBlocEvent, FontScaleBlocState> {
  FontScaleBloc() : super(FontScaleInitial()) {
    Future<void> _emitUpdatedFontScale(
        double fontScale, Emitter<FontScaleBlocState> emit) async {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setDouble('fontScale', fontScale);
        emit(FontScaleUpdated(fontScale));
      } catch (e) {
        emit(FontScaleBlocError(e.toString()));
      }
    }

    on<FontScaleChanged>((event, emit) async {
      await _emitUpdatedFontScale(event.fontScale, emit);
    });
  }
}
