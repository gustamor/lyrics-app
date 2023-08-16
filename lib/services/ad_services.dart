import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../remote_config.dart';

class AppOpenAdManager {
  static Duration maxCacheDuration = const Duration(hours: 4);
  late String _ad_id;
  static bool gOpenAdAllow = true;
  /// Keep track of load time so we don't show an expired ad.
  static DateTime? _appOpenLoadTime;

  static String adUnitId = Platform.isAndroid
      ? (kDebugMode)
          ? "ca-app-pub-3940256099942544/1"
          : Remote.adOpenAdId
      : 'ca-app-pub-3940256099942544/2';

  static AppOpenAd? appOpenAd;
  static bool isShowingAd = false;

  static loadAd() {
    if (Remote.openAdEnabled) {
      AppOpenAd.load(
        adUnitId: adUnitId,
        orientation: AppOpenAd.orientationPortrait,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            _appOpenLoadTime = DateTime.now();
            appOpenAd = ad;
          },
          onAdFailedToLoad: (error) {
            if (kDebugMode) {
              print('AppOpenAd failed to load: $error');
            }
            // Handle the error.
          },
        ),
      );
    }
  }

  /// Whether an ad is available to be shown.
  static bool get isAdAvailable {
    return appOpenAd != null;
  }

  static showAdIfAvailable() {
    if (!isAdAvailable) {
      if (kDebugMode) {
        print('Tried to show ad before available.');
      }
      loadAd();
      return;
    }
    if (isShowingAd) {
      return;
    }
    if (DateTime.now().subtract(maxCacheDuration).isAfter(_appOpenLoadTime!)) {
      //   print('Maximum cache duration exceeded. Loading another ad.');
      appOpenAd!.dispose();
      appOpenAd = null;
      loadAd();
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        isShowingAd = true;
        if (kDebugMode) {
          print('$ad onAdShowedFullScreenContent');
        }
        gOpenAdAllow = false;
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        if (kDebugMode) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
        }
        isShowingAd = false;
        ad.dispose();
        appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        isShowingAd = false;
        ad.dispose();
        appOpenAd = null;
        loadAd();
      },
    );
    if (Remote.openAdEnabled) appOpenAd!.show();
  }
}
class AppLifecycleReactor extends WidgetsBindingObserver{
  final AppOpenAdManager appOpenAdManager;

  AppLifecycleReactor({required this.appOpenAdManager});

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    print('New AppState state: $appState');
    if (appState == AppState.foreground) {
      AppOpenAdManager.showAdIfAvailable();
    }
  }
}
