import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:built_collection/built_collection.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/i18n/strings.g.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'album_image_builder.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/album_images/album_images_bloc.dart';
import 'package:justthelyrics/blocs/artist_info/artist_info_bloc.dart';
import 'package:justthelyrics/blocs/get_lyric/getlyric_bloc.dart';
import 'package:justthelyrics/models/album_info.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:justthelyrics/ui/pages/album_info_page.dart';
import 'package:justthelyrics/ui/pages/top_albums_page.dart';
import 'package:justthelyrics/services/repositories/track_search_repository.dart';
import 'package:justthelyrics/ui/widgets/favorites_button.dart';
import 'package:justthelyrics/ui/widgets/no_lyrics_found.dart';

class TrackLyricScreenBlocBuilder extends StatefulWidget {
  final VoidCallback? adsFunction;
  const TrackLyricScreenBlocBuilder({Key? key, this.adsFunction})
      : super(key: key);

  @override
  State<TrackLyricScreenBlocBuilder> createState() =>
      _TrackLyricScreenBlocBuilderState();
}

class _TrackLyricScreenBlocBuilderState
    extends State<TrackLyricScreenBlocBuilder> with AfterLayoutMixin {
  Future<BuiltList<Track>> getAlbumTracks(Track track) async {
    TrackSearchRepository apiTrack = TrackSearchRepository();

    AlbumTracks? albumInfo = await apiTrack.fetchTracksAlbumFromATrack(track);
    BuiltList<Track> tracks = albumInfo!.track;
    return tracks;
  }

  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: Remote.rateMinDays,
    minLaunches: Remote.rateMinLaunches,
    remindDays: Remote.rateRemindDays,
    remindLaunches: Remote.rateRemindLaunches,
    googlePlayIdentifier: kGPID,
  );
  String copyText = 'COPY';
  SnackBar snackBar = SnackBar(
      content: Text(
        copyToClipboard,
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.amber.withOpacity(0.8));
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    LyricsBlocProvider(context).e.add(ToInitialRequested());

    super.initState();
  }

  void rateApp() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await rateMyApp.init();
      if (rateMyApp.shouldOpenDialog) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        isRatingDialogShown = true;
        rateMyApp.showRateDialog(
          context,
          title: t.ratethisapp, // The dialog title.
          message: t.ratingBodyText,
          rateButton: t.rateButtonText, // The dialog "rate" button text.
          noButton: t.noButtonText, // The dialog "no" button text.
          laterButton: t.laterButtonText, // The dialog "later" button text.
          listener: (button) {
            // The button click listener (useful if you want to cancel the click event).
            switch (button) {
              case RateMyAppDialogButton.rate:
                print('Clicked on "Rate".');

                break;
              case RateMyAppDialogButton.later:
                print('Clicked on "Later".');
                break;
              case RateMyAppDialogButton.no:
                print('Clicked on "No".');
                prefs.setBool(kprefRatingDialogCanceled, true);
                break;
            }

            return true; // Return false if you want to cancel the click event.
          },
          ignoreNativeDialog: Platform.isAndroid,
          dialogStyle: const DialogStyle(), // Custom dialog styles.
          onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
              .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
          // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
          // actionsBuilder: (context) => [], // This one allows you to use your own buttons.
        );
      }
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    AnimateIconController _controller = AnimateIconController();

    late ThemeMode _themeMode;
    return BlocBuilder<LyricsBloc, GetlyricState>(
        buildWhen: (previousState, state) {
      return (previousState != state);
    }, builder: (_, state) {
      if (state is GetlyricInitial) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.pinkAccent,
          ),
        );
      } else if (state is LyricsFetched) {
        Track t = state.track!;

        final _toRemove = "Paroles de la chanson ";
        String? lyric = t.lyric!.replaceAll(_toRemove, ' ');
        if (t.albumOfTrack!.title != null && t.albumOfTrack != null) {
          if (isRatingDialogShown == false) rateApp();
          AlbumImagesBlocProvider(context).e.add(ImagesOfAlbumRequested(
              artist: t.artistName!, album: t.albumOfTrack!.title!));
          ArtistInfoBlocProvider(context)
              .e
              .add(TopAlbumsRequested(t.artistName!));

          return CustomScrollView(slivers: [
            SliverAppBar(
              leading: Container(),
              expandedHeight: 400.h,
              floating: false,
              pinned: false,
              snap: false,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.grey[400],
                    ),
                  ),
                  AlbumImageBlocBuilder(
                    onTapFunction: () async {
                      if (Remote.isAds == true &&
                          Remote.fromLyrycToAlbumInterOn == true &&
                          (Remote.count % Remote.interFreq! == 0) &&
                          widget.adsFunction != null) {
                        widget.adsFunction!();
                      }
                      Remote.count++;
                      BuiltList<Track> tracks = await getAlbumTracks(t);
                      Navigator.pushReplacementNamed(context, AlbumInfoPage.url,
                          arguments: {
                            'tracks': tracks,
                            'albumName': t.albumOfTrack!.title,
                            'artistName': t.artistName
                          });
                    },
                  ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                Center(
                    child: Column(
                  children: [
                    BlocBuilder<ThememodeBloc, ThememodeState>(
                      builder: (mode_ctx, state) {
                        if (state is ThemeModeDark) {
                          _themeMode = ThemeMode.dark;
                        } else if (state is ThemeModeLight) {
                          _themeMode = ThemeMode.light;
                        }
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.h),
                          child: const Divider(height: 3),
                        );
                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: SizedBox(
                              height: 64.h,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 32.h),
                                child: CupertinoButton(child: BlocBuilder<
                                        FontScaleBloc, FontScaleBlocState>(
                                    builder: (fontscale_ctx, font_state) {
                                  double _fontScale = 1.0;
                                  if (font_state is FontScaleUpdated) {
                                    _fontScale = 1.0 / font_state.fontScale;
                                  }
                                  return topAlbumsText(
                                      kTopAlbumbsOf + t.artistName!,
                                      fontScale: _fontScale);
                                }), onPressed: () {
                                  if (Remote.isAds == true &&
                                      Remote.fromLyrycToTopAlbumsPageInterOn ==
                                          true &&
                                      (Remote.count % Remote.interFreq! == 0) &&
                                      widget.adsFunction != null) {
                                    widget.adsFunction!();
                                  }
                                  Remote.count++;

                                  Navigator.pushReplacementNamed(
                                      context, TopAlbumsPage.url,
                                      arguments: t.artistName!);
                                }),
                              ),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.h, bottom: 24.h, right: 24.w, left: 24.w),
                      child: BlocBuilder<FontScaleBloc, FontScaleBlocState>(
                        builder: (font_ctx, font_state) {
                          if (font_state is FontScaleUpdated) {
                            return lyricText(lyric,
                                fontScale: 1.0 / font_state.fontScale);
                          } else {
                            return lyricText(lyric, fontScale: 1.0);
                          }
                        },
                      ),
                    ),
                    BlocBuilder<ThememodeBloc, ThememodeState>(
                      builder: (thememode_ctx, state) {
                        if (state is ThemeModeDark) {
                          _themeMode = ThemeMode.dark;
                        } else if (state is ThemeModeLight) {
                          _themeMode = ThemeMode.light;
                        }
                        return Padding(
                          padding: EdgeInsets.only(bottom: 48.h, top: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 48.h,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 104.w),
                                      child: CupertinoButton(
                                        child: (_themeMode == ThemeMode.dark)
                                            ? SvgPicture.asset(
                                                // panelIcon 's Type:IconData
                                                ImagesUri(TheIcon.copy)
                                                    .getIcon(),
                                                height: 38.h,
                                                width: 38.w,
                                                allowDrawingOutsideViewBox:
                                                    true,
                                                color: Colors.white70)
                                            : SvgPicture.asset(
                                                // panelIcon 's Type:IconData
                                                ImagesUri(TheIcon.copy)
                                                    .getIcon(),
                                                height: 48.0,
                                                width: 48.0,
                                                allowDrawingOutsideViewBox:
                                                    true,
                                                color: Colors.black87),
                                        padding: EdgeInsets.zero,
                                        onPressed: () async {
                                          if (lyric.trim() != "" ||
                                              lyric.trim() !=
                                                  '(Instrumental)') {
                                            FlutterClipboard.copy(
                                                "*${t.name!}* from *${t.artistName!}*\n\n\n${lyric}\n\n$kMoreLyricsAt");

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                          ;
                                        },
                                      )),
                                ),
                              ),
                              Expanded(
                                child:
                                    BlocBuilder<ThememodeBloc, ThememodeState>(
                                  builder: (context, state) {
                                    if (state is ThemeModeDark) {
                                      _themeMode = ThemeMode.dark;
                                    } else if (state is ThemeModeLight) {
                                      _themeMode = ThemeMode.light;
                                    }
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: 104.w,
                                      ),
                                      child: Container(
                                        height: 56.h,
                                        width: 56.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.w),
                                          color: (_themeMode == ThemeMode.dark)
                                              ? Color.fromARGB(255, 0, 0, 0)
                                                  .withOpacity(0.0)
                                              : Colors.white.withOpacity(0.0),
                                        ),
                                        child: Align(
                                            child: FavoritesButton(track: t)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                )),
              ]),
            ),
          ]);
        } else {
          return Padding(
              padding: const EdgeInsets.all(8.0), child: NoLyricFound());
        }
      } else if (state is LyricsError) {
        return Padding(
            padding: const EdgeInsets.all(8.0), child: NoLyricFound());
      } else {
        return Container();
      }
    });
  }

  AutoSizeText headerText(String text, {required double fontScale}) {
    double _maxFont = ((48 / fontScale) > 11) ? (48 / fontScale) : 12;
    int maxFont = _maxFont.toInt();
    double fontSize = maxFont.sp;

    double fontHeight = (40 / fontScale).h;
    double fontHeightFactor = fontHeight / fontSize;
    return AutoSizeText(text,
        style: GoogleFonts.poiretOne(
          textStyle: TextStyle(
            fontSize: fontSize,
            height: fontHeightFactor.h,
            fontWeight: FontWeight.bold,
          ),
        ),
        minFontSize: 18,
        maxLines: 1,
        overflow: TextOverflow.ellipsis);
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
