import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:justthelyrics/services/ad_helper.dart';

import '../blocs/theme_mode/thememode_bloc.dart';
import '../global.dart';

class NativeInlineAd extends StatefulWidget {
  NativeInlineAd( {super.key});

  @override
  State<NativeInlineAd> createState() => _NativeInlineAdState();
}

class _NativeInlineAdState extends State<NativeInlineAd> {
  NativeAd? _ad;
  @override
  void dispose() {
    super.dispose();
  }

  var adHelper = AdHelper();

  @override
  void initState() {
    super.initState();
    ThemeMode mode = getThemeModePrefence();
    bool isDarkMode = (mode == ThemeMode.dark) ? true : false;
    _ad = NativeAd(
        adUnitId: AdHelper.nativeAdUnitId,
        factoryId: 'nativeAdFactory',
        request: AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _ad = ad as NativeAd;
              if (_ad != null) adHelper.addNativeAd(_ad!);
            });
          },
          onAdFailedToLoad: (ad, error) {
            // Releases an ad resource when it fails to load
            ad.dispose();
            print(
                'Ad load failed (code=${error.code} message=${error.message})');
          },
        ),
        customOptions: {"darkMode": isDarkMode});
    _ad!.load();
  }

  @override
  Widget build(BuildContext context) {
    //if (_ad == null) return SizedBox(height: 0);
    var nativead = adHelper.getNativeAd();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          height: (nativead != null) ? 128 : 0,
          alignment: Alignment.center,
          child: (nativead != null)
              ? AdWidget(ad: nativead)
              : SizedBox(height: 0)),
    );
  }
}
