import 'package:flutter/material.dart';
import 'package:justthelyrics/bloc_builders/track_lyrics_builder.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/album_images/album_images_bloc.dart';
import 'package:justthelyrics/blocs/get_lyric/getlyric_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/ui/widgets/lyricas_appbar.dart';
import 'package:after_layout/after_layout.dart';

class LyricsOfTrackPage extends StatelessWidget {
  const LyricsOfTrackPage({Key? key}) : super(key: key);
  static String url = '/lyrics_of_track_page';
  @override
  Widget build(BuildContext context) {
    return const LyricsOfTrackView();
  }
}

// ignore: must_be_immutable
class LyricsOfTrackView extends StatefulWidget {
  const LyricsOfTrackView({Key? key}) : super(key: key);

  @override
  State<LyricsOfTrackView> createState() => _LyricsOfTrackViewState();
}

class _LyricsOfTrackViewState extends State<LyricsOfTrackView>
    with AfterLayoutMixin<LyricsOfTrackView> {
  LastFmImageSize size = LastFmImageSize();
  late String _title = '';
  @override
  void initState() {
    AlbumImagesBlocProvider(context).e.add(ToInitialStateRequested());
    super.initState();
    if (Remote.fromLyrycToAlbumInterOn! &&
        Remote.fromLyrycToTopAlbumsPageInterOn! &&
        (Remote.count % Remote.interFreq! == 0)) loadInterstitialAd();
  }

  @override
  void afterFirstLayout(BuildContext context) {}
  @override
  void didChangeDependencies() {
    final artistNameTitle =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String _artistName = artistNameTitle['artist']!;
    _title = artistNameTitle['title']!;

    //LyricsBlocProvider(context).e.add(ToInitialRequested());
    LyricsBlocProvider(context)
        .e
        .add(TrackLyricsRequested(artist: _artistName, title: _title));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
                    preferredSize: Size(screenSize.width, 16.0),
                    child: LyrikAppBar(
                      routeName: LyricsOfTrackPage.url,
                      title: _title,
                      leftIcon: ImagesUri(TheIcon.backarrow).getIcon(),
                      onLeftClick: () => {
                        LyricsBlocProvider(context).e.add(ToInitialRequested()),
                        Navigator.pop(context)
                      },
                    ),
                  ),
                  const Expanded(
                      child: TrackLyricScreenBlocBuilder(
                          adsFunction: showInterstitialAd)),
                ]),
          )),
    );
  }
}
