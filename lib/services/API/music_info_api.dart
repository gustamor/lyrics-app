import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:justthelyrics/secrets.dart';

class MusicInfoAPI {
  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8, // number of method calls to be displayed
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      // Should each log print contain a timestamp
    ),
  );
  Future<String> getRawLastFMTopAlbums(String artist) async {
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
    };
    final _query =
        'https://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=$artist&api_key=$kApikey&format=json';
    http.Response rawTopAlbums =
        await http.get(Uri.parse(_query), headers: _headers);
    if (rawTopAlbums.statusCode == 200) {
      return utf8.decode(rawTopAlbums.bodyBytes);
    } else {
      throw Exception('Failed to load rawTopAlbums');
    }
  }

  Future<String> getRawLastFMArtistInfo(String artist) async {
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
    };
    final _query =
        'https://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=$artist&api_key=$kApikey&format=json';
    http.Response rawArtistInfo =
        await http.get(Uri.parse(_query), headers: _headers);
    if (rawArtistInfo.statusCode == 200) {
      return utf8.decode(rawArtistInfo.bodyBytes);
    } else {
      throw Exception('Failed to load rawArtistInfo');
    }
  }

  Future<String> getGeniusTrackResults({required String toSearch}) async {
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
      'x-rapidapi-host': 'genius.p.rapidapi.com',
      'x-rapidapi-key': 'PUT_YOURKEY'
    };

    final _query = 'https://genius.p.rapidapi.com/search?q=$toSearch';
    http.Response rawTrackSearchResult =
        await http.get(Uri.parse(_query), headers: _headers);
    if (rawTrackSearchResult.statusCode == 200) {
      return utf8.decode(rawTrackSearchResult.bodyBytes);
    } else {
      throw Exception('Failed to load rawTrackSearchResult');
    }
  }

  Future getRawLastFMAlbumInfo(
      {required String artist, required String album}) async {
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
    };
    final _query =
        'https://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=$kApikey&artist=$artist&album=$album&format=json';
    http.Response rawAlbumInfo =
        await http.get(Uri.parse(_query), headers: _headers);
    if (rawAlbumInfo.statusCode == 200) {
      return utf8.decode(rawAlbumInfo.bodyBytes);
    } else {
      throw Exception('Failed to load rawAlbumInfo');
    }
  }




  Future suggestFromOvhLyrics({required String toSearch}) async {
    final _headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };
    const String endPoint = "api.lyrics.ovh";
    final _parameters = "/suggest/$toSearch";
    final _query = "https://$endPoint$_parameters";

    http.Response rawTrackSearchResult =
        await http.get(Uri.parse(_query), headers: _headers);
    if (rawTrackSearchResult.statusCode == 200) {
      return utf8.decode(rawTrackSearchResult.bodyBytes);
    } else {
      throw Exception('Failed to load suggestFromOvhLyrics');
    }
  }

  Future postLyricFromAPI(
      {required String artist, required String song}) async {
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Proxy-Secret': 'PUT YOUR KEY'
    };
    const String endPoint = "lyricas-api.DOMAIN";
    final _parameters = "/lyrics";
    final _query = "https://$endPoint$_parameters";

    final _body = 'artist=' +
        Uri.encodeQueryComponent(artist) +
        '&title=' +
        Uri.encodeQueryComponent(song);
    try {
      http.Response rawLyric =
          await http.post(Uri.parse(_query), headers: _headers, body: _body);
      if (rawLyric.statusCode == 200) {
        return utf8.decode(rawLyric.bodyBytes);
      } else {
        throw Exception('Failed to load rawLyric.');
      }
    } on SocketException {
      throw NoInternetException(
          'Lyrics Server Temporary Shutdown. If it takes too long contact us, please.');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } catch (e) {
      throw UnknownException('Failed to load rawLyric.');
    }
  }

  Future getRawOvhLyrics({required String artist, required String song}) async {
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
    };
    const String endPoint = "api.lyrics.ovh";
    final _parameters = "/v1/$artist/$song";
    final _query = "https://$endPoint$_parameters";
    try {
      http.Response rawLyric =
          await http.get(Uri.parse(_query), headers: _headers);
      if (rawLyric.statusCode == 200) {
        return utf8.decode(rawLyric.bodyBytes);
      } else {
        throw Exception('Failed to load rawLyric.');
      }
    } on SocketException {
      throw NoInternetException(
          'Lyrics Server Temporary Shutdown. If it takes too long contact us, please.');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } catch (e) {
      throw UnknownException('Failed to load rawLyric.');
    }
  }

  Future getTrackSearchResults({required String toSearch}) async {
    final _headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };
    final _query =
        'https://ws.audioscrobbler.com/2.0/?method=track.search&track=$toSearch&api_key=$kApikey&format=json';
    http.Response rawTrackSearchResult =
        await http.get(Uri.parse(_query), headers: _headers);
    if (rawTrackSearchResult.statusCode == 200) {
      return utf8.decode(rawTrackSearchResult.bodyBytes);
    } else {
      throw Exception('Failed to load rawTrackSearchResult');
    }
  }


  Future getTrackInfo(
      {required String artist, required String trackName}) async {
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
    };
    final _query =
        "https://ws.audioscrobbler.com/2.0/?method=track.getinfo&artist=$artist&track=$trackName&api_key=$kApikey&format=json";
    http.Response rawTrackInfo =
        await http.get(Uri.parse(_query), headers: _headers);
    if (rawTrackInfo.statusCode == 200) {
      return utf8.decode(rawTrackInfo.bodyBytes);
    } else {
      throw Exception('Failed to load rawAlbumFromATrack');
    }
  }

  Future getTopTracks() async {
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=utf-8',
    };
    final _query =
        "https://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=$kApikey&format=json";
    http.Response rawTopTracks =
        await http.get(Uri.parse(_query), headers: _headers);
    if (rawTopTracks.statusCode == 200) {
      return utf8.decode(rawTopTracks.bodyBytes);
    } else {
      throw Exception('Failed to load rawTopTracks');
    }
  }
}

class NoInternetException {
  String message;
  NoInternetException(this.message);
}

class NoServiceFoundException {
  String message;
  NoServiceFoundException(this.message);
}

class InvalidFormatException {
  String message;
  InvalidFormatException(this.message);
}

class UnknownException {
  String message;
  UnknownException(this.message);
}
