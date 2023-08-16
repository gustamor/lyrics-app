import 'dart:convert';
import 'package:justthelyrics/services/API/music_info_api.dart';
import 'package:justthelyrics/models/artist_info.dart';
import 'package:justthelyrics/models/artist_topalbums.dart';

class ArtistRepository {
  final MusicInfoAPI api = MusicInfoAPI();
  /*  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8, // number of method calls to be displayed
      lineLength: 120, // width of the output
      colors: false, // Colorful log messages
      // Should each log print contain a timestamp
    ),
  ); */
  Future<TopAlbums?> getTopAlbums(String artist) async {
    final String rawTopAlbums = await api.getRawLastFMTopAlbums(artist);
    final topAlbumsResponseJsonMap = jsonDecode(rawTopAlbums);
    final topAlbums = topAlbumsResponseJsonMap['topalbums'];
    TopAlbums? albums = TopAlbums.fromJson(topAlbums);
    return albums;
  }

  Future<ArtistInfo?> getLastFMArtistInfo(String artistName) async {
    final String rawArtistInfo = await api.getRawLastFMArtistInfo(artistName);
    final artistInfoResponseJsonMap = jsonDecode(rawArtistInfo);
    final artist = artistInfoResponseJsonMap['artist'];
    ArtistInfo? artistInfo = ArtistInfo.fromJson(artist);
 
    return artistInfo;
  }
}
