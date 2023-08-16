import 'dart:convert';

import 'package:justthelyrics/services/API/music_info_api.dart';
import 'package:justthelyrics/models/album_info.dart';
import 'package:justthelyrics/models/album_of_a_track.dart';
import 'package:justthelyrics/models/search_ovh_result.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:justthelyrics/models/track_search_results.dart';
import 'package:justthelyrics/services/repositories/album_repository.dart';

class TrackSearchRepository {
  final MusicInfoAPI _api = MusicInfoAPI();

  Future<TrackSearchResult?> fetchTrackLastFMSearchResults(
      String toSearch) async {
    final rawTrackSearchResults =
        await _api.getTrackSearchResults(toSearch: toSearch);
    final trackSearchResultsJsonMap = json.decode(rawTrackSearchResults);
    final trackNames = trackSearchResultsJsonMap['results']['trackmatches'];

    TrackSearchResult? trackSearchResult =
        TrackSearchResult.fromJson(trackNames);

    // ignore: unrelated_type_equality_checks
    /*   return (LyricsDB().containsBlackListed(toSearch) == true)
        ? trackSearchResult = TrackSearchResult()
        : trackSearchResult; */
    return trackSearchResult;
  }

  Future<TrackOvhSearchResult?> fetchTrackOVhSearchResults(
      String toSearch) async {
    final rawTrackSearchResults =
        await _api.suggestFromOvhLyrics(toSearch: toSearch);
    final trackSearchResultsJsonMap = json.decode(rawTrackSearchResults);

    final tracks = trackSearchResultsJsonMap;
    TrackOvhSearchResult? trackSearchResult;
    try {
      trackSearchResult = TrackOvhSearchResult.fromJson(tracks);
    } catch (e) {
      trackSearchResult = null;

    }

    return trackSearchResult;
  }

  Future<String> getTrackMbid(
      {required String artistName, required String trackName}) async {
    final rawTrackInfoResults =
        await _api.getTrackInfo(artist: artistName, trackName: trackName);
    final mbidResultsJsonMap = json.decode(rawTrackInfoResults);
    //_trackInfoResponsesToCached(trackInfoResultsJsonMap);

    final String mbid = mbidResultsJsonMap['track']['mbid'];
    //print(mbid);

    return mbid;
  }

  Future<AlbumOfTheTrack?> getTrackInfo(
      {required String artistName, required String trackName}) async {
    final rawTrackInfoResults =
        await _api.getTrackInfo(artist: artistName, trackName: trackName);
    final trackInfoResultsJsonMap = jsonDecode(rawTrackInfoResults);
    _trackInfoResponsesToCached(trackInfoResultsJsonMap);
    try {
      final AlbumOfTheTrack? album =
          AlbumOfTheTrack.fromJson(trackInfoResultsJsonMap['track']['album']);
      return album;
    } catch (e) {
      // print(e.toString());
    }
    return AlbumOfTheTrack();
  }

  Future<dynamic> fetchTracksAlbumFromATrack(Track track) async {
    try {
      final AlbumTracksRepository _albumApi = AlbumTracksRepository();

      AlbumTracks? albumInfo = await _albumApi.fetchAlbumTracks(
          track.artistName!, track.albumOfTrack!.title!);
      return albumInfo;
    } catch (e) {
      return null;
    }
  }

  void _trackInfoResponsesToCached(var trackInfoResultsJsonMap) async {
    /* var box = await Hive.openBox("artist");
    final artist =
        ArtistDos.fromMap(trackInfoResultsJsonMap['track']['artist']);
    box.add(artist);
    box = await Hive.openBox("album");
    final album = Album.fromMap(trackInfoResultsJsonMap['track']['album']);
    box.add(album);*/
  }
}
