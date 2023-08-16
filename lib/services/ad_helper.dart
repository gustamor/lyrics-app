import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  List<NativeAd> nativeAds = [];
  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/11"
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/11';
    }
    throw UnsupportedError("Unsupported platform");
  }

  void addNativeAd(NativeAd ad) {
    if (nativeAds.length < 5) {
      nativeAds.insert(0, ad);
    } else {
      // Si ya hay 5 anuncios, elimina el último y agrega el nuevo al principio
      nativeAds.removeLast();
      nativeAds.insert(0, ad);
    }
  }

  void flushNativeAds() {
    nativeAds.clear();
  }

  NativeAd? popNativeAd() {
    if (nativeAds.isNotEmpty) {
      return nativeAds.removeLast();
    }
    return null; // Devuelve null si la lista está vacía
  }

  NativeAd? getNativeAd() {
    if (nativeAds.isNotEmpty) {
      return nativeAds.last;
    }
    return null; // Devuelve null si la lista está vacía
  }
}
