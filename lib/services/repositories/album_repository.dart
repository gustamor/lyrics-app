import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:justthelyrics/services/API/music_info_api.dart';
import 'package:justthelyrics/models/album_images.dart';
import 'package:justthelyrics/models/wiki_info.dart';
import 'package:justthelyrics/models/album_info.dart';

class AlbumTracksRepository {
  final MusicInfoAPI api = MusicInfoAPI();
 final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8, // number of method calls to be displayed
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      // Should each log print contain a timestamp
    ),
  );
  Future<AlbumTracks?> fetchAlbumTracks(String artist, String album) async {
    final String rawAlbumInfo =
        await api.getRawLastFMAlbumInfo(artist: artist, album: album);
    final albumInfoResponseJsonMap = jsonDecode(rawAlbumInfo);

    final rawTracks = await albumInfoResponseJsonMap['album']['tracks'];
    if (rawTracks == null) {
      return null;
    }
    AlbumTracks? tracks;
    
    try {
       tracks = AlbumTracks.fromJson(rawTracks);
    } catch (e) {
      logger.v(e.toString());
    }
    return tracks;
  }

  Future<AlbumImages?> fetchAlbumImages(String artist, String album) async {
    final String rawAlbumInfo =
        await api.getRawLastFMAlbumInfo(artist: artist, album: album);
    final albumInfoResponseJsonMap = jsonDecode(rawAlbumInfo);

    final rawImages = await albumInfoResponseJsonMap['album'];

    if (rawImages == null) {
      return null;
    }

    final images = AlbumImages.fromJson(rawImages);

    return images;
  }

  Future<WikiInfo?> fetchAlbumWikiInfo(String artist, String album) async {
    final String rawAlbumInfo =
        await api.getRawLastFMAlbumInfo(artist: artist, album: album);
    final albumInfoResponseJsonMap = jsonDecode(rawAlbumInfo);

    final rawAlbum = await albumInfoResponseJsonMap['album']['wiki'];
    if (rawAlbum == null) {
      return null;
    }
    final albumWikiInfo = WikiInfo.fromJson(rawAlbum);
    return albumWikiInfo;
  }
  
}
