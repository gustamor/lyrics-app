// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:justthelyrics/ui/pages/lyrics_of_track_page.dart';
import 'package:justthelyrics/remote_config.dart';

class TrackNameItemCard extends StatelessWidget {
  TrackNameItemCard({
    Key? key,
    this.adsFunction,
    required this.track,
    required this.number,
  }) : super(key: key);
  final VoidCallback? adsFunction;
  final Track track;
  final int number;
  late ThemeMode _currentTheme;

  @override
  Widget build(BuildContext context) {
    Map<String, String> artistNameTitle = {
      'artist': track.artist!.name!,
      'title': track.name!
    };
    return BlocBuilder<ThememodeBloc, ThememodeState>(
        builder: (context, state) {
      if (state is ThemeModeDark) {
        _currentTheme = ThemeMode.dark;
      } else if (state is ThemeModeLight) {
        _currentTheme = ThemeMode.light;
      } else {
        _currentTheme = ThemeMode.light;
      }
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 3.h,
                  spreadRadius: 3.h,
                  color: (_currentTheme == ThemeMode.dark)
                      ? Colors.grey.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.2))
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.w),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                child: Container(
                    //height: 56.h,
                    decoration: BoxDecoration(
                      color: (_currentTheme == ThemeMode.dark)
                          ? Colors.white.withOpacity(0.1)
                          : Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8.w),
                      border: Border.all(
                        color: (_currentTheme == ThemeMode.dark)
                            ? Colors.white.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.6),
                        width: 1.5.w,
                      ),
                    ),
                    //TODF romTitleItemToLyricInterOn
                    child: ListTile(
                        title: BlocBuilder<FontScaleBloc, FontScaleBlocState>(
                          builder: (fontscale_ctx, font_state) {
                            double _fontScale = 1.0;
                            if (font_state is FontScaleUpdated) {
                              _fontScale = 1.0 / font_state.fontScale;
                            }
                            return titleTrackNumberText(
                                "$number.  " + track.name!,
                                fontScale: _fontScale);
                          },
                        ),
                        onTap: () => {
                              if (Remote.isAds == true &&
                                  Remote.fromTitleItemToLyricInterOn == true &&
                                  (Remote.count % Remote.interFreq! == 0) &&
                                  adsFunction != null)
                                {adsFunction!()},
                              Remote.count++,
                              Navigator.pushNamed(
                                  context, LyricsOfTrackPage.url,
                                  arguments: artistNameTitle),
                            })),
              ),
            ),
          ));
    });
  }

  AutoSizeText titleTrackNumberText(String text, {required double fontScale}) {
    double _maxFont = ((19 / fontScale) > 11) ? (19 / fontScale) : 12;
    int maxFont = _maxFont.toInt();
    double fontSize = maxFont.sp;
    double fontHeight = (24 / fontScale).h;
    double fontHeightFactor = fontHeight / fontSize;
    return AutoSizeText(
      text,
      style: GoogleFonts.poiretOne(
        textStyle: TextStyle(
            fontSize: fontSize,
            height: fontHeightFactor.h,
            fontWeight: FontWeight.w600),
      ),
      maxFontSize: maxFont.toDouble(),
      maxLines: 1,
    );
  }

  AutoSizeText titleTrackText(String subtitle, {required double fontScale}) {
    double _maxFont = ((18 / fontScale) > 11) ? (18 / fontScale) : 12;
    int maxFont = _maxFont.toInt();
    double fontSize = maxFont.sp;
    double fontHeight = (24 / fontScale).h;
    double fontHeightFactor = fontHeight / fontSize;
    return AutoSizeText(
      subtitle,
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
