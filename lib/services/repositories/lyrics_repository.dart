import 'dart:convert';
import 'package:justthelyrics/services/API/music_info_api.dart';
import 'package:justthelyrics/models/album_of_a_track.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:justthelyrics/services/repositories/track_search_repository.dart';

class LyricsRepository {
  final MusicInfoAPI api = MusicInfoAPI();
  Future<Track> getLyrics(
      {required String artist, required String song}) async {
    final _toRemove = "Paroles de la chanson $song par $artist";
    final _toRemoveB = "Paroles de la chanson $song par";
    // TrackDos track;
    final _trackId = "id_$artist|$song";

  var rawLyrics = await api.postLyricFromAPI(artist: artist, song: song);
    String _lyricsData = rawLyrics.replaceAll(_toRemove, '');
    _lyricsData = _lyricsData.replaceAll(_toRemoveB, '');

    var _decodedResponse = json.decode(_lyricsData);
    String _lyrics = _decodedResponse['lyrics'];

    TrackSearchRepository _trackApi = TrackSearchRepository();
    AlbumOfTheTrack? _album =
        await _trackApi.getTrackInfo(artistName: artist, trackName: song);

    TrackBuilder track = Track().toBuilder()
      ..id = _trackId
      ..artistName = artist
      ..name = song
      ..albumOfTrack = _album!.toBuilder()
      ..lyric = _lyrics;

    return track.build();
  }

    return false;
  }

  Future<void> _storeInSharedPreferences(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stored = prefs.getStringList(kStoredTracks) ?? [];
    stored.add(id);
    prefs.setStringList(kStoredTracks, stored);
  }

}
