import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/favorites/favorites_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/ui/pages/home.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/ui/widgets/cards/favorite_track_card.dart';
import 'package:justthelyrics/ui/widgets/lyric_dialog.dart';
import 'package:justthelyrics/ui/widgets/lyricas_appbar.dart';

// ignore: must_be_immutable
class FavoritesSongsPage extends StatefulWidget {
  FavoritesSongsPage({Key? key}) : super(key: key);
  static String url = '/favorites-songs';
  List<String>? favorites = [];
  @override
  _FavoritesSongsPageState createState() => _FavoritesSongsPageState();
}

class _FavoritesSongsPageState extends State<FavoritesSongsPage> {
  @override
  void initState() {
    super.initState();
    if (Remote.fromFavoriteItemToLyricInterOn! &&
        (Remote.count % Remote.interFreq! == 0)) loadInterstitialAd();
  }

  @override
  void dispose() {
    //interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    late ThemeMode _themeMode;

    List<String>? _favorites;

    FavoritesBlocProvider(context).e.add(LoadFavorites());

    return BlocBuilder<ThememodeBloc, ThememodeState>(
      builder: (contextTheme, stateTheme) {
        if (stateTheme is CurrentThemeMode) {
          _themeMode = stateTheme.themeMode;
        }
        if (stateTheme is ThememodeInitial) {
          _themeMode = ThemeMode.system;
        }
        return Scaffold(
          appBar: null,
          body: SafeArea(
            top: true,
            bottom: true,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PreferredSize(
                      preferredSize: Size(screenSize.width, 50.0),
                      child: BlocBuilder<FavoritesBloc, FavoritesState>(
                        builder: (_, stateFavorites) {
                          if (stateFavorites is LoadedFavorites) {
                            _favorites = stateFavorites.favorites;
                          } else if (stateFavorites is UpdatedFavorites) {
                            _favorites = stateFavorites.favorites;
                          }

                          return LyrikAppBar(
                              routeName: FavoritesSongsPage.url,
                              title: kFavorites,
                              leftIcon: ImagesUri(TheIcon.menuSharp).getIcon(),
                              onLeftClick: () =>
                                  drawerKey!.currentState!.openDrawer(),
                              rightIcon:
                                  (_favorites != null && _favorites!.isNotEmpty)
                                      ? ImagesUri(TheIcon().deleteAll).getIcon()
                                      : null,
                              rightIconSize: 20.h,
                              onRightClick: () async {
                                if (_favorites != null) {
                                  if (_favorites!.isNotEmpty) {
                                    bool answer = await Dialogs.confirm(context,
                                        title: kConfirmation,
                                        body: kDeleteAllConfirmationText,
                                        confirmText: kYesPlease,
                                        cancelText: kNoThanks);
                                    if (answer) {
                                      FavoritesBlocProvider(context)
                                          .e
                                          .add(DeleteAllFavoritesPressed());
                                    }
                                  }
                                }
                              });
                        },
                      ),
                    ),
                    BlocBuilder<FavoritesBloc, FavoritesState>(
                      builder: (context, state) {
                        if (state is FavoritesInitial) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is LoadedFavorites) {
                          _favorites = state.favorites;
                        } else if (state is UpdatedFavorites) {
                          _favorites = state.favorites;
                        } else {
                          _favorites = [];
                        }

                        return Expanded(
                          child:  ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: _favorites?.length ?? 0,
                                itemBuilder: (toptrackCtx, index) =>
                                    FavoriteTrackCard(
                                        adsFunction: showInterstitialAd,
                                        favoriteId: _favorites![index]),
                                separatorBuilder: (toptrackCtx, index) =>
                                    const Divider()
                          ),
                          
                        );
                      },
                    ),
                    // CallNativeAd().ad,
                  ]),
            ),
          ),
        );
      },
    );
  }
}
