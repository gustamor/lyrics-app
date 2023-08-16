part of 'currentpageview_bloc.dart';

@immutable
abstract class CurrentpageviewState {}

class CurrentpageviewInitial extends CurrentpageviewState {}

class CurrentPage extends CurrentpageviewState {
  final int currentPage;
  CurrentPage(this.currentPage);
}


