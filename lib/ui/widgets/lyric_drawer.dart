import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/pages/aboutus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class LyricDrawer extends StatelessWidget {
  const LyricDrawer({Key? key}) : super(key: key);

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void goToSettingsPage(var context) {
    try {
      Navigator.pushNamed(context, '/settings',
          arguments: getThemeModePrefence());
    }
    // ignore: empty_catches
    catch (e) {}
  }

  void goToApp() async {
    try {
      AndroidIntent intent = const AndroidIntent(
        action: 'action_view',
        data: kGPAppLink,
      );
      await intent.launch();
    }
    // ignore: empty_catches
    catch (e) {}
  }

  void goToDeveloper() async {
    try {
      AndroidIntent intent = const AndroidIntent(
        action: 'action_view',
        data: kGPDeveloper,
      );
      await intent.launch();
    }
    // ignore: empty_catches
    catch (e) {}
  }

  void goToFacebook() {}

  void goToEmail() async {
    try {
      _launchURL(
          'EMAIL', '$kAppName', 'Hi\nI want to share with you:\n$kGPAppLink');
      // ignore: empty_catches
    } catch (e) {}
  }

  void goToOthers() {
    try {
      Share.share('I want to share $kAppName with you:  ' + kGPAppLink);
      // ignore: empty_catches
    } catch (e) {}
  }

  void goToRate(BuildContext context) async {
    try {
      AndroidIntent intent = const AndroidIntent(
        action: 'action_view',
        data: kGPAppLink,
      );
      await intent.launch();
      // ignore: empty_catches
    } catch (e) {}
    Navigator.pop(context);
  }

  void goToExit(BuildContext context) {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    late ThemeMode _themeMode = getThemeModePrefence();
    return Drawer(
      child: BlocBuilder<FontScaleBloc, FontScaleBlocState>(
        builder: (fontscale_ctx, font_state) {
          double _fontScale = 1.0;
          if (font_state is FontScaleUpdated) {
            _fontScale = 1.0 / font_state.fontScale;
          }
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              BlocBuilder<ThememodeBloc, ThememodeState>(
                builder: (contextTheme, state) {
                  if (state is ThemeModeDark) {
                    _themeMode = ThemeMode.dark;
                  } else if (state is ThemeModeLight) {
                    _themeMode = ThemeMode.light;
                  }
                  return DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: (_themeMode == ThemeMode.dark)
                                ? const AssetImage(
                                    'assets/images/drawerdark.webp')
                                : const AssetImage(
                                    'assets/images/drawerlight.webp'),
                            fit: BoxFit.cover)),
                    child: null,
                  );
                },
              ),
              ListTile(
                title: _text(kSettings, fontScale: _fontScale),
                onTap: () {
                  goToSettingsPage(context);
                },
              ),
              ListTile(
                title: _text(kShareByEmailMessage, fontScale: _fontScale),
                onTap: () async {
                  goToEmail();
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: _text(kShareAppMessage, fontScale: _fontScale),
                onTap: () async {
                  goToOthers();
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: _text(kRateApp, fontScale: _fontScale),
                onTap: () {
                  goToRate(context);
                },
              ),
              ListTile(
                title: _text(kAbout, fontScale: _fontScale),
                onTap: () async {
                  Navigator.of(context).pushNamed(AboutUsPage.url);
                },
              ),
              ListTile(
                title: _text(kExit, fontScale: _fontScale),
                onTap: () async {
                  goToExit(context);
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _text(String text, {required double fontScale}) {
    double _maxFont = ((21 / fontScale) > 11) ? (21 / fontScale) : 12;
    int maxFont = _maxFont.toInt();
    double fontSize = maxFont.sp;
    double fontHeight = (14 / fontScale);
    double fontHeightFactor = fontHeight / fontSize;
    return AutoSizeText(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.poiretOne(
        textStyle: TextStyle(
            fontSize: fontSize,
            height: fontHeightFactor.h,
            fontWeight: FontWeight.w700),
      ),
      maxFontSize: maxFont.toDouble(),
      maxLines: 1,
    );
  }
}
