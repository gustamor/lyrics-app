part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class InternetInit extends InternetEvent {
  final ConnectivityResult connectivity;
  InternetInit(this.connectivity);
}

class InternetConnectedEvent extends InternetEvent {}

class InternetDisconnectedEvent extends InternetEvent {}

class InternetStatusRequested extends InternetEvent {}
