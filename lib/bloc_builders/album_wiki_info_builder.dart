import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/blocs/album_wiki/album_wiki_bloc.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/global.dart';

class AlbumWikiBlocBuilder extends StatelessWidget {
  const AlbumWikiBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumWikiBloc, AlbumWikiState>(
        builder: (context, state) {
      if (state is AlbumWikiInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AlbumWikiFetched) {
        String? wiki = state.album.content;
        Strings strings = Strings();
        final content = strings.removeAfterMatch(wiki, '<a href');
        return BlocBuilder<FontScaleBloc, FontScaleBlocState>(
          builder: (fontscale_ctx, font_state) {
            double _fontScale = 1.0;
            if (font_state is FontScaleUpdated) {
              _fontScale = 1.0 / font_state.fontScale;
            }
            return Column(
              children: [
                SizedBox(height: 40.h),
                Center(child: headerText(kHistory, fontScale: _fontScale)),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 8.w),
                  child: wikiContentText(content, fontScale: _fontScale),
                ),
                SizedBox(height: 16.h),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.h, right: 16.w),
                      child: Text(
                        "Source: Last.FM™",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    )),
                SizedBox(height: 8.h),
              ],
            );
          },
        );
      } else if (state is AlbumWikiError) {
        return Container();
      } else {
        return Container();
      }
    });
  }
}

AutoSizeText TitleText(String text, {required double fontScale}) {
  double maxFont = ((24 / fontScale) > 11) ? (24 / fontScale) : 12;

  double fontSize = maxFont.sp;
  double fontHeight = 24.h;
  double fontHeightFactor = fontHeight / fontSize;
  return AutoSizeText(
    text,
    textAlign: TextAlign.left,
    style: GoogleFonts.poiretOne(
      textStyle: TextStyle(
          fontSize: fontSize,
          height: fontHeightFactor.h,
          fontWeight: FontWeight.w800),
    ),
    maxFontSize: maxFont,
    maxLines: 1,
  );
}

Container wikiContentText(String content, {required double fontScale}) {
  double maxFont = ((20 / fontScale) > 11) ? (20 / fontScale) : 12;
  double fontSize = maxFont.sp;
  double fontHeight = (32 / fontScale).h;
  double fontHeightFactor = fontHeight / fontSize;
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            content,
            style: GoogleFonts.poiretOne(
              textStyle: TextStyle(
                  fontSize: fontSize,
                  height: fontHeightFactor.h,
                  fontWeight: FontWeight.w600),
            ),
          )));
}

Container headerText(String text, {required double fontScale}) {
  double maxFont = ((40 / fontScale) > 11) ? (40 / fontScale) : 12;
  double fontSize = maxFont.sp;
  double fontHeight = (32 / fontScale).h;
  double fontHeightFactor = fontHeight / fontSize;
  return Container(
    child: Column(
      children: [
        Text(
          text,
          style: GoogleFonts.poiretOne(
            textStyle: TextStyle(
                fontFamily: 'Lato',
                fontSize: fontSize,
                height: fontHeightFactor.h,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 40.w),
            child: Divider(height: 16.h))
      ],
    ),
  );
}
