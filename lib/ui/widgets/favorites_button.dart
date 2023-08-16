import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/favorites/favorites_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/models/storedSongs.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesButton extends StatefulWidget {
  const FavoritesButton({Key? key, required this.track, this.size = 40})
      : super(key: key);
  final Track track;
  final bool isFavorite = false;
  final double size;

  @override
  _FavoritesButtonState createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton> {
  bool isFavorite = false;
  var box;
  void _isTrackInFavorites(final track) async {
    String id = track.id!;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList("favorites");

    if (favorites == null) {
      favorites = [];
      prefs.setStringList("favorites", favorites);
      setState(() {
        isFavorite = false;
      });
    }
    try {
      if (favorites.contains(id)) {
        setState(() {
          isFavorite = true;
        });
      } else {
        setState(() {
          isFavorite = false;
        });
      }
    } catch (e) {
      setState(() {
        isFavorite = false;
      });
    }
  }

  void _didFavorite(final track) async {
    String id = track.id!;

    var stored = StoredSong(
      id: id,
      artist: track.artistName! ?? "",
      songTitle: track.name!,
      lyrics: track.lyric!,
    );
    try {} catch (e) {
      print("HIVE error: " + e.toString());
    }
    await box.put(id, stored);
    FavoritesBlocProvider(context).e.add(DidFavorite(id: id));
    setState(() {
      isFavorite = true;
    });
  }

  void _undoneFavorite(final track) async {
    String id = track.id!;

    FavoritesBlocProvider(context).e.add(UndoneFavorite(id: id));
    setState(() {
      isFavorite = false;
    });
  }

  @override
  void initState() {
    openHive();
    _isTrackInFavorites(widget.track);
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  openHive() async {
    box = await Hive.openBox(kHiveStored);
  }

  @override
  Widget build(BuildContext context) {
    late ThemeMode _themeMode;

    final colorScheme = Theme.of(context).colorScheme;
    final track = widget.track;
    // _isTrackInFavorites(track);
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () async {
          setState(() {
            if (isFavorite) {
              _undoneFavorite(track);
            } else {
              _didFavorite(track);
            }
          });
        },
        child: BlocBuilder<ThememodeBloc, ThememodeState>(
          builder: (context, state) {
            if (state is ThemeModeDark) {
              _themeMode = ThemeMode.dark;
            } else {
              _themeMode = ThemeMode.light;
            }
            return Padding(
                padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
                child: (isFavorite)
                    ? SvgPicture.asset(ImagesUri(TheIcon.heartSolid).getIcon(),
                        width: widget.size.w, color: Colors.red)
                    : SvgPicture.asset(ImagesUri(TheIcon.heartLine).getIcon(),
                        width: widget.size.w,
                        color: (_themeMode == ThemeMode.dark)
                            ? Colors.white70
                            : Colors.black87));
          },
        ));
  }
}
