import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justthelyrics/bloc_builders/search_bloc_builder.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/ui/pages/home.dart';
import 'package:justthelyrics/ui/widgets/lyricas_appbar.dart';

import 'package:justthelyrics/ui/widgets/search_input_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    Key? key,
    this.themeMode,
  }) : super(key: key);
  static String url = '/search';
  ThemeMode? themeMode;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
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
                child: BlocBuilder<ThememodeBloc, ThememodeState>(
                  builder: (context, state) {
                    if (state is ThemeModeDark) {
                      themeMode = ThemeMode.dark;
                    } else {
                      themeMode = ThemeMode.light;
                    }
                    return LyrikAppBar(
                      routeName: SearchPage.url,
                      title: kSearch,
                      leftIcon: ImagesUri(TheIcon.menuSharp).getIcon(),
                      onLeftClick: () => drawerKey!.currentState!.openDrawer(),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SearchBox(),
                    SearchTracksResults(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SearchTracksResults extends StatelessWidget {
  const SearchTracksResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchBlocBuilder(),
        ],
      ),
    ));
  }
}

@override
bool get wantKeepAlive => true;
