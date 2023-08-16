part of 'artist_info_bloc.dart';

@immutable
abstract class ArtistInfoState {}

class ArtistInfoInitial extends ArtistInfoState {}

class ArtistInfoFetched extends ArtistInfoState {
  final ArtistInfo artist;

  ArtistInfoFetched({required this.artist});
}

class ArtistInfoError extends ArtistInfoState {
  final String error;

  ArtistInfoError({required this.error});
}

class TopAlbumsFetched extends ArtistInfoState {
  final BuiltList<TopAlbumInfo>? albums;
  TopAlbumsFetched({required this.albums});
}

class TopAlbumsError extends ArtistInfoState {
  final String error;
  TopAlbumsError({required this.error});
}
