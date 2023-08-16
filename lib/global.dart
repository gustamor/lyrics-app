import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:justthelyrics/i18n/strings.g.dart';
import 'package:justthelyrics/main.dart';
import 'package:justthelyrics/models/album_images.dart';
import 'package:justthelyrics/models/album_of_a_track.dart';
import 'package:justthelyrics/models/artist_info.dart';
import 'package:justthelyrics/models/databaseclasses.dart';
import 'package:justthelyrics/models/wiki_info.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/services/repositories/album_repository.dart';
import 'package:justthelyrics/services/repositories/artist_repository.dart';
import 'package:justthelyrics/services/repositories/track_search_repository.dart';
import 'package:rate_my_app/rate_my_app.dart';

const kAppName = 'The Lyrikas App';
const kNullString = '(null)';
const kDevName = "Buenas Risas Company";
final kDevEmailAddress = "buenas.risas.company@gmail.com";
const maxFailedLoadAttempts = 1;
const kHiveStored = 'sotredBox';
const String kStoredTracks = 'STORED_TRACKS_IDS';
const kRawLyricNotFound = 'Failed to load rawLyric';
const kBlurImages = [
  'L68g~pt700WX_4ay8_az00WCx]ad',
  'L370c9]_0K0[^#tKD-I1yBKN57vo',
  'L79iGN}g:?Mm?Xx,VyQ^%eKf0{EC'
];
const kGPID = "net.avivavoz.bts.justthelyrics";
const kGPAppLink =
    'https://play.google.com/store/apps/details?id=net.avivavoz.bts.justthelyrics';
const kGPDeveloper =
    "https://play.google.com/store/apps/developer?id=net.avivavoz.bts.justthelyrics";
const kTHEMEMODE = 'themeMode';
const kPREFERREDSTORED = 'preferStored';
final kItsnice = t.itsnice;
final kSearch = t.search;
final kOk = t.ok;
final kCancel = t.cancel;
final kExit = t.exit;
final kRateApp = t.rateapp;
final kRateUsMessage = t.rateappgoogleplay;
final kInternetDisconnted = t.internetdisconnected;
final kStayHere = t.stayhere;
final kShareByEmailMessage = t.shareByEmail;
final kShareAppMessage = t.shareApp;
final kAbout = t.about;
final kSettings = t.settings;
final kFavorites = t.favorites;
final kAboutText = t.abouttext;
final kDeleteAllConfirmationText = t.deleteallConfirmatiom;
final kDeleteOneFavoriteConfirmationText = t.deleteOneConfirmatiom;
final kConfirmation = t.confirmation;
final kYesPlease = t.yesPlease;
final kYes = t.yes;
final kNoThanks = t.nothanks;
final kLyricNotFound = t.lyricnotfound;
final kExitMessage = t.exitMessage;
final kWantExit = t.wantexit;
final kHistory = t.historyOfAlbum;
final kTopAlbumbsOf = t.topalbums;
final kTopAlbumsArtist = t.topalbumsartist;
final kBestLyrics = t.bestLyrics;
final copyToClipboard = t.copyToClipboard;
final kMoreLyricsAt = t.morelyricsat;

final kprefRatingDialogCanceled = "ratingDialogCanceled";
bool _isInterstitialAdLoaded = false;
bool get isInterstitialLoaded => _isInterstitialAdLoaded;
var _numInterstitialLoadAttempts;
InterstitialAd? _interstitialAd;
bool isRatingDialogShown = false;

String get interstitialAdUnitId {
  if (Remote.adInterId != null) {
    return Remote.adInterId!;
  } else {
    return "";
  }
}

enum ConnectionType {
  WIFI,
  MOBILE,
  NONE,
}

class LastFmImageSize {
  int get small => 0;
  int get medium => 1;
  int get large => 2;
  int get extralarge => 3;
  int get mega => 4;
}

class TheMode {
  int get system => 0;
  int get dark => 1;
  int get light => 2;
}

class TheIcon {
  int get deleteAll => 0;
  int get settings => 1;
  static int get backarrow => 2;
  static get heartLine => 3;
  static int get heartSolid => 4;
  static int get menuSharp => 5;
  static int get home => 6;
  static int get close => 7;
  static int get copy => 8;
}

class Strings {
  Strings();

  String removeAfterMatch(String? input, String match) {
    var pos = input!.indexOf(match);
    if (pos != -1) {
      return input.substring(0, pos);
    }
    return input;
  }
}

Future<void> kFetchInfo(String _artistName, String _trackTitle) async {
  final ArtistRepository artistApi = ArtistRepository();
  final TrackSearchRepository trackApi = TrackSearchRepository();
  final AlbumTracksRepository albumApi = AlbumTracksRepository();

  final _trackId = "id_$_artistName+$_trackTitle";
  final _albumId = "album$_trackId";
  AlbumImages? album;
  ArtistInfo? artist = await artistApi.getLastFMArtistInfo(_artistName);
  AlbumOfTheTrack? albumTrack = await trackApi.getTrackInfo(
      artistName: _artistName, trackName: _trackTitle);
  try {
    if (albumTrack != null) {
      album = await albumApi.fetchAlbumImages(_artistName, albumTrack.title!);
    }
  } catch (e) {
    //  print("Error fetching album images :" + e.toString());
  }
  WikiInfo? wiki;
  try {
    if (albumTrack != null) {
      wiki = await albumApi.fetchAlbumWikiInfo(_artistName, albumTrack.title!);
    }
  } catch (e) {
    // print("Error fetching wiki images :" + e.toString());
  }
}

Future<void> kFetchInfoWrapper(List<TrackDos> tracks) {
  return Future.wait(tracks.map((track) async {
    await kFetchInfo(track.artist!, track.title!);
  }));
}

RateMyApp rateMyApp() => RateMyApp(
      preferencesPrefix: 'rateMyApp_',
      minDays: 0, // Show rate popup on first day of install.
      minLaunches: 1,
      remindDays: 0,
      remindLaunches: 1,
      googlePlayIdentifier: kGPID,
    );

ThemeMode getThemeModePrefence() {
  ThemeMode _themeMode;
  int _t = prefs.getInt(kTHEMEMODE) ?? 0;
  if (_t == TheMode().light) {
    _themeMode = ThemeMode.light;
  } else if (_t == TheMode().dark) {
    _themeMode = ThemeMode.dark;
  } else {
    _themeMode = ThemeMode.system;
  }
  return _themeMode;
}

bool getSharedPrefrerredMode() {
  return prefs.getBool(kPREFERREDSTORED) ?? false;
}

bool gRewardAdAllow = true;

void loadInterstitialAd() {
  if (Remote.isAds == true) {
    try {
      InterstitialAd.load(
          adUnitId: (kDebugMode)
              ? "ca-app-pub-3940256099942544/111"
              : interstitialAdUnitId,
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              //  print('$ad loaded');
              _interstitialAd = ad;
              _isInterstitialAdLoaded = true;
              _numInterstitialLoadAttempts = maxFailedLoadAttempts;
              _interstitialAd!.setImmersiveMode(true);
            },
            onAdFailedToLoad: (LoadAdError error) {
              //   print('InterstitialAd failed to load: $error.');
              _numInterstitialLoadAttempts += 1;
              if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
                loadInterstitialAd();
              }
            },
          ));

    } catch (e) {
      //  print("Error loading interstitial ad :" + e.toString());

    }
  }
}

void showInterstitialAd() {
  if (Remote.isAds == true) {
    try {
      if (_interstitialAd != null) {
        _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (InterstitialAd ad) {
            //     print('ad onAdShowedFullScreenContent.'),
          },
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            //     print('$ad onAdDismissedFullScreenContent.');
            loadInterstitialAd();
          },
          onAdFailedToShowFullScreenContent:
              (InterstitialAd ad, AdError error) {
            //     print('$ad onAdFailedToShowFullScreenContent: $error');
            loadInterstitialAd();
          },
        );
        if (_isInterstitialAdLoaded) {
          _interstitialAd!.show();

          Remote.count++;
        }
      }
    } catch (e) {
      //  print("Error showing interstitial ad :" + e.toString());
    }
  }
}

void interstitialDispose() {
  try {
    _interstitialAd?.dispose();
  } catch (e) {
    //  print("Error disposing interstitial ad :" + e.toString());
  }
}
