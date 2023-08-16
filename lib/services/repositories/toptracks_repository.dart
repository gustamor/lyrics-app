import 'dart:convert';

import 'package:justthelyrics/services/API/music_info_api.dart';
import 'package:justthelyrics/models/album_of_a_track.dart';
import 'package:justthelyrics/models/databaseclasses.dart';
import 'package:justthelyrics/services/repositories/track_search_repository.dart';

class TopTracksRepository {
  final MusicInfoAPI api = MusicInfoAPI();

  Future<List<TrackDos>> getTopTracks() async {
    List<TrackDos> topTracks = [];
    final String rawTopTracks = await api.getTopTracks();
    final topTracksResponse = jsonDecode(rawTopTracks);
    TrackSearchRepository _trackApi = TrackSearchRepository();
    try {
      for (var track in topTracksResponse['tracks']['track']) {
        final artist = track['artist']['name'];
        final song = track['name'];
        final _trackId = "id_$artist|$song";
        final _albumId = "album$_trackId";

        AlbumOfTheTrack? _album =
            await _trackApi.getTrackInfo(artistName: artist, trackName: song);
        if (_album!.artist != null) {
          TrackDos t = TrackDos(
            mbid: _trackId,
            artist: artist,
            title: song,
            albumMbid: _album.mbid,
            albumId: _albumId,
          );
          topTracks.add(t);
        } else {
          //  print("Track is null");
        }
      }
    } catch (e) {
      //  print(e.toString());
    }
    return topTracks;
  }
}
