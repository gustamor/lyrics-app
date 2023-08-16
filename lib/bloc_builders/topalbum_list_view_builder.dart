import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justthelyrics/blocs/artist_info/artist_info_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/models/album_topalbums.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/services/native_inline_ad.dart';
import 'package:justthelyrics/ui/widgets/cards/albums_card.dart';

import '../blocs/theme_mode/thememode_bloc.dart';

// ignore: must_be_immutable
class TopAlbumsBlocBuilder extends StatefulWidget {
  TopAlbumsBlocBuilder({Key? key}) : super(key: key);

  @override
  State<TopAlbumsBlocBuilder> createState() => _TopAlbumsBlocBuilderState();
}

class _TopAlbumsBlocBuilderState extends State<TopAlbumsBlocBuilder> {
  BuiltList<TopAlbumInfo>? topAlbums;

  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    if (Remote.fromTopAlbumItemToAlbumInterOn! &&
        (Remote.count % Remote.interFreq! == 0)) loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistInfoBloc, ArtistInfoState>(
        builder: (contextInfo, state) {
      if (state is TopAlbumsFetched) {
        topAlbums = state.albums;
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: topAlbums!.length,
          itemBuilder: (BuildContext context, int index) =>
              (topAlbums![index].name != kNullString)
                  ? (index % Remote.adNativeFreqInList == 0 && index > 0)
                      ? NativeInlineAd()
                      : AlbumCard(
                          album: topAlbums![index - (index ~/ Remote.adNativeFreqInList)],
                          adsFuntion: showInterstitialAd,
                        )
                  : const SizedBox(height: 0),
          separatorBuilder: (context, index) => const SizedBox(height: 0),
        );
      } else if (state is TopAlbumsError) {
        return Text(state.error);
      } else {
        return const Text('Unknown state');
      }
    });
  }
}
