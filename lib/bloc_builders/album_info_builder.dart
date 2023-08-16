import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justthelyrics/blocs/album_info_track/album_info_track_bloc.dart';
import 'package:justthelyrics/global.dart';

import 'package:justthelyrics/models/album_info.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/ui/widgets/cards/track_name_item_card.dart';

class AlbumInfoBlocBuilderWrapper extends StatefulWidget {
  AlbumInfoBlocBuilderWrapper({Key? key, required this.artistName})
      : super(key: key);
  final String artistName;

  @override
  State<AlbumInfoBlocBuilderWrapper> createState() =>
      _AlbumInfoBlocBuilderWrapperState();
}

class _AlbumInfoBlocBuilderWrapperState
    extends State<AlbumInfoBlocBuilderWrapper> {
  @override
  void initState() {
    super.initState();
    if (Remote.count % Remote.interFreq! == 0) loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    String _artistName = widget.artistName;

    return BlocBuilder<AlbumTracksBloc, AlbumTracksState>(
        builder: (context, state) {
      if (state is AlbumInfoInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AlbumInfoTrackFetched) {
        AlbumTracks album = state.album;
        final tracks = album.track;
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            //  Track track = tracks[index];
            Track track =
                tracks[index].rebuild((b) => b..artistName = _artistName);
            return TrackNameItemCard(
              track: track,
              number: index + 1,
              adsFunction: showInterstitialAd,
            );
          },
        );
      } else {
        return const Text("");
      }
    });
  }
}
