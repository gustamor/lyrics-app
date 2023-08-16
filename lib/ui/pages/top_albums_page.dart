import 'package:flutter/material.dart';
import 'package:justthelyrics/bloc_builders/topalbum_list_view_builder.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/ui/widgets/lyricas_appbar.dart';

class TopAlbumsPage extends StatefulWidget {
  const TopAlbumsPage({Key? key}) : super(key: key);
  static String url = '/top_albums';
  @override
  State<TopAlbumsPage> createState() => _TopAlbumsPageState();
}

class _TopAlbumsPageState extends State<TopAlbumsPage> {
  @override
  Widget build(BuildContext context) {
    // final artistName = ModalRoute.of(context)?.settings.arguments as String;

    return const Scaffold(
      appBar: null,
      body: TopAlbumsView(),
    );
  }
}

class TopAlbumsView extends StatelessWidget {
  const TopAlbumsView({Key? key}) : super(key: key);
  // final String? artistName;

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
            children: <Widget>[
              PreferredSize(
                preferredSize: Size(screenSize.width, 16.0),
                child: LyrikAppBar(
                  routeName: TopAlbumsPage.url,
                  title: kTopAlbumsArtist,
                  leftIcon: ImagesUri(TheIcon.backarrow).getIcon(),
                  onLeftClick: () => Navigator.pop(context),
                ),
              ),
              Expanded(child: TopAlbumsBlocBuilder())
            ]),
      ),
    );
  }
}
