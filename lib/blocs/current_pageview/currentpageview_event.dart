part of 'currentpageview_bloc.dart';

@immutable
abstract class CurrentpageviewEvent {}

class InitialPage extends CurrentpageviewEvent {}

class CurrentChanged extends CurrentpageviewEvent {
  final int index;
  CurrentChanged(this.index);
}
  