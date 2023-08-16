// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/models/album_topalbums.dart';
import 'package:justthelyrics/ui/pages/album_info_page.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/ui/widgets/image_network.dart';

class AlbumCard extends StatelessWidget {
  AlbumCard({Key? key, required this.album, this.adsFuntion}) : super(key: key);

  final TopAlbumInfo album;
  final LastFmImageSize size = LastFmImageSize();
  late ThemeMode _currentTheme;
  final VoidCallback? adsFuntion;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThememodeBloc, ThememodeState>(
        builder: (context, state) {
      if (state is ThemeModeDark) {
        _currentTheme = ThemeMode.dark;
      } else if (state is ThemeModeLight) {
        _currentTheme = ThemeMode.light;
      } else {
        _currentTheme = ThemeMode.system;
      }
      return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 8.h,
                  spreadRadius: 8.h,
                  color: (_currentTheme == ThemeMode.dark)
                      ? Colors.grey.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.2))
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.w),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                child: Container(
                    height: 64.h,
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
                    child: BlocBuilder<FontScaleBloc, FontScaleBlocState>(
                      builder: (fontscale_ctx, font_state) {
                        double _fontScale = 1.0;
                        if (font_state is FontScaleUpdated) {
                          _fontScale = 1.0 / font_state.fontScale;
                        }
                        return ListTile(
                            title:
                                cardTitle(album.name!, fontScale: _fontScale),
                            subtitle: cardSubTitle(album.artist?.name ?? '',
                                fontScale: _fontScale),
                            leading: ImageNetwork(
                              url: album.image![size.medium].url,
                              width: 40.w,
                              height: 40.h,
                            ),
                            onTap: () => {
                                  if (Remote.isAds == true &&
                                      Remote.fromTopAlbumItemToAlbumInterOn ==
                                          true &&
                                      (Remote.count % Remote.interFreq! == 0) &&
                                      adsFuntion != null)
                                    {adsFuntion!()},
                                  Remote.count++,
                                  Navigator.pushReplacementNamed(
                                      context, AlbumInfoPage.url,
                                      arguments: album)
                                });
                      },
                    )),
              ),
            ),
          ));
    });
  }

  AutoSizeText cardTitle(String title, {required double fontScale}) {
    double _maxFont = ((17 / fontScale) > 11) ? (17 / fontScale) : 12;
    int maxFont = _maxFont.toInt();
    double fontSize = maxFont.sp;
    double fontHeight = (24 / (fontScale * 2)).h;
    double fontHeightFactor = fontHeight / fontSize;
    return AutoSizeText(
      title,
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

  AutoSizeText cardSubTitle(String subtitle, {required double fontScale}) {
    double _maxFont = ((16 / fontScale) > 11) ? (16 / fontScale) : 12;
    int maxFont = _maxFont.toInt();

    double fontSize = maxFont.sp;
    double fontHeight = (24 / (fontScale * 2)).h;
    double fontHeightFactor = fontHeight / fontSize;
    return AutoSizeText(
      subtitle,
      textAlign: TextAlign.left,
      style: GoogleFonts.poiretOne(
        textStyle: TextStyle(
            fontSize: fontSize,
            height: fontHeightFactor.h,
            fontWeight: FontWeight.w500),
      ),
      maxFontSize: maxFont.toDouble(),
      maxLines: 1,
    );
  }
}
