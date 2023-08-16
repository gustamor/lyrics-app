part of 'getlyric_bloc.dart';

@immutable
abstract class GetlyricState {}

class GetlyricInitial extends GetlyricState {}

class LyricsFetched extends GetlyricState {
  final Track? track;

  LyricsFetched({required this.track});
}

class LyricsError extends GetlyricState {
  final String error;

  LyricsError({required this.error});
}


