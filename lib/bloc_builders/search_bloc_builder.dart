import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/album_images/album_images_bloc.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/get_lyric/getlyric_bloc.dart';
import 'package:justthelyrics/blocs/search_form/searchform_bloc.dart';
import 'package:justthelyrics/blocs/search_form/searchform_event.dart';
import 'package:justthelyrics/blocs/search_form/searchform_state.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';

import 'package:justthelyrics/ui/pages/lyrics_of_track_page.dart';

class SearchBlocBuilder extends StatefulWidget {
  const SearchBlocBuilder({Key? key}) : super(key: key);

  @override
  State<SearchBlocBuilder> createState() => _SearchBlocBuilderState();
}

class _SearchBlocBuilderState extends State<SearchBlocBuilder> {
  void makeTrack(String artistName, String title, var context) {
    Map<String, String> artistNameTitle = {
      'artist': artistName,
      'title': title
    };
    Navigator.pushNamed(context, LyricsOfTrackPage.url,
        arguments: artistNameTitle);
  }

  @override
  void initState() {
    SearchBlocProvider(context).e.add(SearchInitialized());
    /* LyricsBlocProvider(context)
        .e
        .add(ToInitialRequested()); */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late ThemeMode _currentTheme;

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchInitial) {
        return const CircularProgressIndicator();
      } else if (state is StartState) {
        return Container();
      } else if (state is SearchResult) {
        final tracks = state.tracks!.data;
        return BlocBuilder<ThememodeBloc, ThememodeState>(
          builder: (context, state) {
            if (state is ThemeModeDark) {
              _currentTheme = ThemeMode.dark;
            } else if (state is ThemeModeLight) {
              _currentTheme = ThemeMode.light;
            }
            return Expanded(
                child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 4.h,
                    spreadRadius: 4.h,
                    color: (_currentTheme == ThemeMode.dark)
                        ? Colors.grey.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.2))
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: (_currentTheme == ThemeMode.dark)
                        ? Colors.white.withOpacity(0.1)
                        : Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: (_currentTheme == ThemeMode.dark)
                                ? Colors.white.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.6),
                          ),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: tracks!.length,
                      itemBuilder: (context, index) {
                        final lyrics = tracks[index];
                        return BlocBuilder<FontScaleBloc, FontScaleBlocState>(
                            builder: (fontscale_ctx, font_state) {
                          double _fontScale = 1.0;
                          if (font_state is FontScaleUpdated) {
                            _fontScale = 1.0 / font_state.fontScale;
                          }

                          return ListTile(
                            title:
                                titleText(lyrics.name!, fontScale: _fontScale),
                            subtitle: subTitleText(lyrics.artist!.name!,
                                fontScale: _fontScale),
                            onTap: () async {
                              AlbumImagesBlocProvider(context)
                                  .e
                                  .add(ToInitialStateRequested());
                                LyricsBlocProvider(context)
                                  .e
                                  .add(ToInitialRequested());  

                              makeTrack(
                                  lyrics.artist!.name!, lyrics.name!, context);
                            },
                          );
                        });
                      }),
                ),
              ),
            ));
          },
        );
      } else {
        return Container();
      }
    });
  }
}

AutoSizeText titleText(String text, {required double fontScale}) {
  double _maxFont = ((19 / fontScale) > 11) ? (19 / fontScale) : 12;
  int maxFont = _maxFont.toInt();
  double fontSize = maxFont.toDouble();
  double fontHeight = (16 / fontScale).h;
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
    maxFontSize: maxFont.toDouble(),
    maxLines: 1,
  );
}

AutoSizeText subTitleText(String text, {required double fontScale}) {
  double _maxFont = ((17 / fontScale) > 11) ? (17 / fontScale) : 12;
  int maxFont = _maxFont.toInt();

  double fontSize = maxFont.toDouble();
  double fontHeight = (16 / fontScale).h;
  double fontHeightFactor = fontHeight / fontSize;
  return AutoSizeText(
    text,
    textAlign: TextAlign.left,
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
