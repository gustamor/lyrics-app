part of 'preferredstored_bloc.dart';

abstract class PreferredstoredEvent {}

class PreferredstoredInit extends PreferredstoredEvent {
  final bool id;
  PreferredstoredInit(this.id);
}

class PreferredStoredChanged extends PreferredstoredEvent {
  final bool id;
  PreferredStoredChanged(this.id);
}

class PreferredStoredRequested extends PreferredstoredEvent {}

class PreferredstoredOnPressed extends PreferredstoredEvent {}

class PreferredstoredOffPressed extends PreferredstoredEvent {}
