import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:justthelyrics/models/album_topalbums.dart';
import 'package:justthelyrics/models/artist_info.dart';
import 'package:justthelyrics/models/artist_topalbums.dart';
import 'package:justthelyrics/services/repositories/artist_repository.dart';
import 'package:meta/meta.dart';

part 'artist_info_event.dart';
part 'artist_info_state.dart';

class ArtistInfoBloc extends Bloc<ArtistInfoEvent, ArtistInfoState> {
  ArtistInfoBloc() : super(ArtistInfoInitial()) {
    final ArtistRepository api = ArtistRepository();

    Future<void> _fetchedArtist(
        String artistName, Emitter<ArtistInfoState> emit) async {
      try {
        final ArtistInfo? _artist = await api.getLastFMArtistInfo(artistName);

        emit(ArtistInfoFetched(artist: _artist!));
      } catch (e) {
        emit(ArtistInfoError(error: e.toString()));
      }
    }

    Future<void> _getTopAlbums(
        String artist, Emitter<ArtistInfoState> emit) async {
      try {
        final TopAlbums? _topalbums = await api.getTopAlbums(artist);
        final BuiltList<TopAlbumInfo>? topAlbums =
            _topalbums?.album!.toBuiltList();
        emit(TopAlbumsFetched(albums: topAlbums));
      } catch (e) {
        emit(TopAlbumsError(error: e.toString()));
      }
    }

    on<ArtistInfoRequested>((event, emit) async {
      await _fetchedArtist(event.artistName, emit);
    });

    on<TopAlbumsRequested>((event, emit) async {
      await _getTopAlbums(event.artistName, emit);
    });
  }
}
