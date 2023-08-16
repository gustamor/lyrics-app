import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/internet/internet_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/models/storedSongs.dart';
import 'package:justthelyrics/ui/pages/top_albums_page.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/ui/widgets/lyricas_appbar.dart';

class LyricsHivePage extends StatefulWidget {
  const LyricsHivePage({Key? key, this.adsFunction}) : super(key: key);
  static String url = '/lyrics_hive_page';
  final VoidCallback? adsFunction;
  @override
  State<LyricsHivePage> createState() => _LyricsHivePageState();
}

class _LyricsHivePageState extends State<LyricsHivePage> {
  var box;
  StoredSong? _songData;

  @override
  void initState() {
    openHive();

    super.initState();
  }

  openHive() async {
    box = await Hive.openBox(kHiveStored);
  }

  @override
  void didChangeDependencies() {
    final _storedSong =
        ModalRoute.of(context)?.settings.arguments as StoredSong;
    _songData = _storedSong;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    InternetBlocProvider(context).e.add(InternetStatusRequested());

    return Scaffold(
        appBar: null,
        body: SafeArea(
          top: true,
          bottom: true,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PreferredSize(
                  preferredSize: Size(screenSize.width, 16.0),
                  child: LyrikAppBar(
                    routeName: LyricsHivePage.url,
                    title: _songData!.songTitle,
                    leftIcon: ImagesUri(TheIcon.backarrow).getIcon(),
                    onLeftClick: () => {Navigator.pop(context)},
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0.h, bottom: 24.h, right: 24.w, left: 24.w),
                          child: BlocBuilder<FontScaleBloc, FontScaleBlocState>(
                            builder: (font_ctx, font_state) {
                              if (font_state is FontScaleUpdated) {
                                return lyricText(_songData!.lyrics!,
                                    fontScale: 1.0 / font_state.fontScale);
                              } else {
                                return lyricText(_songData!.lyrics!,
                                    fontScale: 1.0);
                              }
                            },
                          ),
                        ),
                        BlocBuilder<InternetBloc, InternetState>(
                          builder: (context, state) {
                            if (state == InternetConnected ||
                                state == InternetInitial) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.h),
                                  child: SizedBox(
                                    height: 64.h,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 32.h),
                                      child: CupertinoButton(child: BlocBuilder<
                                              FontScaleBloc,
                                              FontScaleBlocState>(
                                          builder: (fontscale_ctx, font_state) {
                                        double _fontScale = 1.0;
                                        if (font_state is FontScaleUpdated) {
                                          _fontScale =
                                              1.0 / font_state.fontScale;
                                        }
                                        return topAlbumsText(
                                            kTopAlbumbsOf + _songData!.artist!,
                                            fontScale: _fontScale);
                                      }), onPressed: () {
                                        /*  if (Remote.isAds == true &&
                                            Remote.fromLyrycToTopAlbumsPageInterOn ==
                                                true &&
                                            (Remote.count % Remote.interFreq! ==
                                                0) &&
                                            widget.adsFunction != null) {
                                          widget.adsFunction!();
                                        }
                                        Remote.count++; */

                                        Navigator.pushReplacementNamed(
                                            context, TopAlbumsPage.url,
                                            arguments: _songData!.artist!);
                                      }),
                                    ),
                                  ));
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }

  AutoSizeText topAlbumsText(String text, {required double fontScale}) {
    double _maxFont = ((26 / fontScale) > 11) ? (26 / fontScale) : 12;
    int maxFont = _maxFont.toInt();

    double fontSize = maxFont.sp;
    double fontHeight = (24 / fontScale).h;
    double fontHeightFactor = fontHeight / fontSize;
    return AutoSizeText(text,
        style: GoogleFonts.poiretOne(
          textStyle: TextStyle(
            fontSize: fontSize,
            height: fontHeightFactor.h,
            fontWeight: FontWeight.bold,
          ),
        ),
        maxFontSize: maxFont.toDouble(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis);
  }

  Text lyricText(String text, {required double fontScale}) {
    double fontSize = (21 / fontScale).sp;
    double fontHeight = (40 / (fontScale * 1.5)).h;
    double fontHeightFactor = fontHeight / fontSize;
    return Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poiretOne(
          textStyle: TextStyle(
              fontSize: fontSize,
              height: fontHeightFactor.h,
              fontWeight: FontWeight.w600),
        ));
  }

  Text titleText(String text, {required double fontScale}) {
    double fontSize = (16 / fontScale).sp;
    double fontHeight = (32 / fontScale).h;
    double fontHeightFactor = fontHeight / fontSize;
    return Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poiretOne(
          textStyle: TextStyle(
              color: Colors.red[800],
              fontSize: fontSize,
              height: fontHeightFactor.h,
              fontWeight: FontWeight.w600),
        ));
  }
}
