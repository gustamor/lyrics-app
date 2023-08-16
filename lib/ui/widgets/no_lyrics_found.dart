import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/remote_config.dart';

// ignore: must_be_immutable
class NoLyricFound extends StatelessWidget {
  NoLyricFound({Key? key}) : super(key: key);
  late ThemeMode _themeMode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<ThememodeBloc, ThememodeState>(
      builder: (contextTheme, stateTheme) {
        if (stateTheme is CurrentThemeMode) {
          _themeMode = stateTheme.themeMode;
        }
        if (stateTheme is ThememodeInitial) {
          _themeMode = ThemeMode.system;
        }
        return Container(
          width: double.infinity,
          decoration: (Remote.imagenNotFoundWidget == true)
              ? BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(
                      "assets/images/notfound.webp",
                    ),
                    opacity: (_themeMode == ThemeMode.light) ? 0.1 : 0.05,
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          child: BlocBuilder<FontScaleBloc, FontScaleBlocState>(
            builder: (fontscale_ctx, font_state) {
              double _fontScale = 1.0;
              if (font_state is FontScaleUpdated) {
                _fontScale = 1.0 / font_state.fontScale;
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NotFoundText(kLyricNotFound, fontScale: _fontScale),
                ],
              );
            },
          ),
        );
      },
    ));
  }
}

AutoSizeText NotFoundText(String text, {required double fontScale}) {
  double _maxFont = ((21 / fontScale) > 11) ? (21 / fontScale) : 12;
  int maxFont = _maxFont.toInt();
  double fontSize = maxFont.sp;
  double fontHeight = 16.h;
  double fontHeightFactor = fontHeight / fontSize;
  return AutoSizeText(
    text,
    textAlign: TextAlign.center,
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
