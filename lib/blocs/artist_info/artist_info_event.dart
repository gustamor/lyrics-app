part of 'artist_info_bloc.dart';

@immutable
abstract class ArtistInfoEvent {}

class ArtistInfoRequested extends ArtistInfoEvent {
  final String artistName;
  ArtistInfoRequested(this.artistName);
}

class TopAlbumsRequested extends ArtistInfoEvent {
  final String artistName;
  TopAlbumsRequested(this.artistName);
}
