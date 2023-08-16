part of 'getlyric_bloc.dart';

@immutable
abstract class GetlyricEvent {}

class TrackLyricsRequested extends GetlyricEvent {
  final String artist;
  final String title;
  TrackLyricsRequested({required this.artist, required this.title});
}

class ToInitialRequested extends GetlyricEvent {

}
