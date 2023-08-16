import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/favorites/favorites_bloc.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/internet/internet_bloc.dart';
import 'package:justthelyrics/blocs/prefered_stored/preferredstored_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/i18n/strings.g.dart';
import 'package:justthelyrics/ui/pages/lyrics_hive_page.dart';
import 'package:justthelyrics/ui/pages/lyrics_of_track_page.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/ui/widgets/lyric_dialog.dart';

class FavoriteTrackCard extends StatefulWidget {
  const FavoriteTrackCard(
      {Key? key, required this.favoriteId, this.adsFunction})
      : super(key: key);
  final String? favoriteId;
  final VoidCallback? adsFunction;
  @override
  State<FavoriteTrackCard> createState() => _FavoriteTrackCardState();
}

class _FavoriteTrackCardState extends State<FavoriteTrackCard> {
  late String artist;
  late String title;
  var box;
  bool? _internetConnected;
  var longPressIncrementDuration = 2000;
  late bool preferStored;
  @override
  void initState() {
    openHive();
    super.initState();
  }

  _undoneFavorite(final id) async {
    bool answer = await Dialogs.confirm(context,
        title: kConfirmation,
        body: kDeleteOneFavoriteConfirmationText,
        confirmText: kYesPlease,
        cancelText: kNoThanks);

    if (answer == true) {
      String _id = id;
      FavoritesBlocProvider(context).e.add(UndoneFavorite(id: _id));
    }
  }

  openHive() async {
    box = await Hive.openBox(kHiveStored);
  }

  @override
  Widget build(BuildContext context) {
    InternetBlocProvider(context).e.add(InternetStatusRequested());

    preferStored = getSharedPrefrerredMode();

    String id = widget.favoriteId!.split('id_')[1];
    artist = id.split('|')[0];
    title = id.split('|')[1];
    Map<String, String> artistNameTitle = {'artist': artist, 'title': title};
    return BlocBuilder<FontScaleBloc, FontScaleBlocState>(
      builder: (fontscale_ctx, font_state) {
        double _fontScale = 1.0;
        if (font_state is FontScaleUpdated) {
          _fontScale = 1.0 / font_state.fontScale;
        }
        return BlocBuilder<InternetBloc, InternetState>(
          builder: (internet_ctx, state) {
            if (state == InternetConnected) {
              _internetConnected = true;
            } else if (state == InternetDisconnected) {
              _internetConnected = false;
            } else {
              _internetConnected = null;
            }
            return BlocBuilder<PreferredstoredBloc, PreferredstoredState>(
              builder: (prefered_ctx, state) {
                if (state is PreferredStoredOn) {
                  preferStored = true;
                } else if (state is PreferredStoredOff) {
                  preferStored = false;
                }

                return ListTile(
                    title: TitleText(title, fontScale: _fontScale),
                    subtitle: subTitleText(artist, fontScale: _fontScale),
                    onLongPress: () {
                      _undoneFavorite(widget.favoriteId);
                    },
                    trailing: PopupMenuButton(
                      onSelected: (String value) {
                        setState(() {
                          if (value == 'remove') {
                            _undoneFavorite(widget.favoriteId);
                          } else if (value == 'share') {}
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'remove',
                          child: Text((t.remove)),
                        ),
                      ],
                      child: Icon(Icons.more_vert),
                    ),
                    onTap: () {
                      if ((_internetConnected == null ||
                              _internetConnected == true) &&
                          preferStored == false) {
                        if (Remote.isAds == true &&
                            Remote.fromFavoriteItemToLyricInterOn == true &&
                            (Remote.count % Remote.interFreq! == 0) &&
                            (widget.adsFunction != null)) {
                          widget.adsFunction!();
                        }
                        Remote.count++;
                        Navigator.pushNamed(context, LyricsOfTrackPage.url,
                            arguments: artistNameTitle);
                      } else {
                        final _songData = box.get(widget.favoriteId);

                        Navigator.pushNamed(context, LyricsHivePage.url,
                            arguments: _songData);
                      }
                    });
              },
            );
          },
        );
      },
    );
  }
}

AutoSizeText TitleText(String text, {required double fontScale}) {
  double _maxFont = ((19 / fontScale) > 11) ? (19 / fontScale) : 12;
  int maxFont = _maxFont.toInt();

  double fontSize = maxFont.sp;
  double fontHeight = (24 / fontScale).h;
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
  double fontSize = maxFont.sp;
  double fontHeight = (24 / fontScale).h;
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
