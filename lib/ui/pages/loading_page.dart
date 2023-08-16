/* import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:justthelyrics/pages/home.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage(
      {Key? key,
      required this.themeMode,
      required this.onThemeModeChanged,
      required this.flexSchemeData})
      : super(key: key);
  ThemeMode themeMode;
  final Function onThemeModeChanged;
  final FlexSchemeData flexSchemeData;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late InterstitialAd _interstitialAd;
  int _interstitialLoadAttempts = 3;

  void initInterstitial() {
    _interstitialAd = InterstitialAd()..load();
    _interstitialAd.onEvent.listen((e) {
      final event = e.keys.first;
      switch (event) {
        case FullScreenAdEvent.loading:
          print('loading');
          break;
        case FullScreenAdEvent.loaded:
          print('loaded');
          break;
        case FullScreenAdEvent.loadFailed:
          final errorCode = e.values.first;
          print('loadFailed $errorCode');
          break;
        case FullScreenAdEvent.showed:
          print('ad showed');
          break;
        case FullScreenAdEvent.closed:
          _interstitialAd.load();
          print('ad closed');
          break;
        case FullScreenAdEvent.showFailed:
          final errorCode = e.values.first;
          print('ad failed to show $errorCode');
          break;
        default:
          break;
      }
    });
    loadInterstitial();
  }

  void loadInterstitial() async {
    try {
      if (!_interstitialAd.isAvailable) await _interstitialAd.load();
      if (_interstitialAd.isAvailable) _interstitialAd.show();

      _interstitialAd.onEvent.listen((e) {
        final event = e.keys.first;
        switch (event) {
          case FullScreenAdEvent.loading:
            print('loading');
            break;
          case FullScreenAdEvent.loaded:
            print('loaded');
            break;
          case FullScreenAdEvent.loadFailed:
            _interstitialLoadAttempts += 1;
            if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
              loadInterstitial();
            } else {
              getHomeData();
            }

            final errorCode = e.values.first;
            print('loadFailed $errorCode');

            break;
          case FullScreenAdEvent.showed:
            print('ad showed');
            break;
          case FullScreenAdEvent.closed:
            getHomeData();

            print('ad closed');
            break;
          case FullScreenAdEvent.showFailed:
            getHomeData();
            final errorCode = e.values.first;
            print('ad failed to show $errorCode');

            break;
          default:
            break;
        }
      });
    } catch (e) {
      getHomeData();
    }
  }

  Future<void> getHomeData() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return HomePage(
          themeMode: widget.themeMode,
          onThemeModeChanged: (ThemeMode mode) {},
          flexSchemeData: widget.flexSchemeData,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();

    if (Remote.isAds == true &&
        Remote.fromLyrycToAlbumInterOn == true &&
        (Remote.count % Remote.interFreq! == 0)) {
      initInterstitial();
    } else {
      getHomeData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
 */