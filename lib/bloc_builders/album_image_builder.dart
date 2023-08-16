import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justthelyrics/blocs/album_images/album_images_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/widgets/image_network.dart';

// ignore: must_be_immutable
class AlbumImageBlocBuilder extends StatelessWidget {
  AlbumImageBlocBuilder({Key? key, this.url, this.onTapFunction})
      : super(key: key);
  final LastFmImageSize size = LastFmImageSize();
  final Image? url;
  final VoidCallback? onTapFunction;
  late ThemeMode _currentTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<AlbumImagesBloc, AlbumImagesState>(
            builder: (_, stateImage) {
          if (stateImage is AlbumImagesInitial) {}
          if (stateImage is AlbumImagesFetched) {
            final images = stateImage.images;

            return BlocBuilder<ThememodeBloc, ThememodeState>(
              builder: (context, state) {
                if (state is ThemeModeDark) {
                  _currentTheme = ThemeMode.dark;
                } else if (state is ThemeModeLight) {
                  _currentTheme = ThemeMode.light;
                } else {
                  _currentTheme = ThemeMode.system;
                }
                return Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 8.h,
                        spreadRadius: 8.h,
                        color: (_currentTheme == ThemeMode.dark)
                            ? Colors.grey.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.2))
                  ]),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                      child: Container(
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
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: ImageNetwork(
                            url: images[size.extralarge].url,
                            height: 300.h,
                            width: 300.w,

                            //  onPressed: () => getAlbumTracks(track)
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (stateImage is AlbumImagesError) {
            return Container(
              child: Image.asset(
                "assets/images/albumlist_placeholder.webp",
                height: 440.h,
                width: 288.w,
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
