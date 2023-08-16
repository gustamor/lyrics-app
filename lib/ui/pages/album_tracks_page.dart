import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justthelyrics/bloc_builders/album_image_builder.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/album_images/album_images_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/ui/widgets/cards/track_name_item_card.dart';
import 'package:justthelyrics/ui/widgets/lyricas_appbar.dart';

class AlbumTracksPage extends StatelessWidget {
  const AlbumTracksPage({
    Key? key,
  }) : super(key: key);
  static String url = '/album_tracks';

  @override
  Widget build(BuildContext context) {
    final settings =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return BlocProvider(
      create: (context) => AlbumImagesBloc(),
      child: AlbumTracksView(
          tracks: settings['tracks'],
          albumName: settings['albumName'],
          artistName: settings['artistName']),
    );
  }
}

class AlbumTracksView extends StatefulWidget {
  const AlbumTracksView(
      {Key? key,
      required this.tracks,
      required this.albumName,
      required this.artistName})
      : super(key: key);
  final BuiltList<Track> tracks;
  final String albumName;
  final String artistName;

  @override
  _AlbumTracksViewState createState() => _AlbumTracksViewState();
}

class _AlbumTracksViewState extends State<AlbumTracksView> {
  final LastFmImageSize size = LastFmImageSize();
  //final AdHelper _adHelper = AdHelper();
  @override
  void initState() {
    super.initState();
    if (Remote.fromTitleItemToLyricInterOn! &&
        (Remote.count % Remote.interFreq! == 0)) loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    AlbumImagesBlocProvider(context).e.add(ImagesOfAlbumRequested(
        artist: widget.artistName, album: widget.albumName));

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
                    child: LyrikAppBar(
                      routeName: AlbumTracksPage.url,
                      title: widget.albumName,
                      leftIcon: ImagesUri(TheIcon.backarrow).getIcon(),
                      onLeftClick: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(
                    child: CustomScrollView(slivers: [
                      SliverAppBar(
                        //title: Text("Album"),
                        leading: Container(),
                        expandedHeight: 400.h,
                        floating: false,
                        pinned: false,
                        snap: false,

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
                            AlbumImageBlocBuilder()
                          ]),
                          //  title: Center(child: Text(_albumName)),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 8.0,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.tracks.length,
                              itemBuilder: (context, index) {
                                // rack track = tracks[index];
                                return TrackNameItemCard(
                                  track: widget.tracks[index],
                                  number: index + 1,
                                  adsFunction: showInterstitialAd,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ]),
                  )
                ]),
          )),
    );
  }
}
