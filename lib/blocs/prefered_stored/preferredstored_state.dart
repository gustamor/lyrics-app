part of 'preferredstored_bloc.dart';

@immutable
abstract class PreferredstoredState {}

class PreferredstoredInitial extends PreferredstoredState {}

class CurrentPreferredStored extends PreferredstoredState {
  final bool id;

  CurrentPreferredStored(this.id);
}

class PreferredStoredOn extends CurrentPreferredStored {
  PreferredStoredOn() : super(true);
}

class PreferredStoredOff extends CurrentPreferredStored {
  PreferredStoredOff() : super(false);
}
