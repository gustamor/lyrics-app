import 'package:bloc/bloc.dart';
import 'package:justthelyrics/blocs/search_form/searchform_bloc.dart';
import 'package:justthelyrics/blocs/search_form/searchform_event.dart';
import 'package:meta/meta.dart';

part 'currentpageview_event.dart';
part 'currentpageview_state.dart';

class CurrentpageviewBloc
    extends Bloc<CurrentpageviewEvent, CurrentpageviewState> {
  CurrentpageviewBloc() : super(CurrentpageviewInitial()) {
    SearchBloc searchBloc = SearchBloc();
    on<CurrentChanged>((event, emit) {
      searchBloc.add(SearchInitialized());
      emit(CurrentPage(event.index));
    });

    on<InitialPage>((event, emit) {
      emit (CurrentpageviewInitial());
    });
  }
}
