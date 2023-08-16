import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/bloc_builders/album_image_builder.dart';
import 'package:justthelyrics/bloc_builders/album_info_builder.dart';
import 'package:justthelyrics/bloc_builders/album_wiki_info_builder.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/album_images/album_images_bloc.dart';
import 'package:justthelyrics/blocs/album_info_track/album_info_track_bloc.dart';
import 'package:justthelyrics/blocs/album_wiki/album_wiki_bloc.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/models/album_topalbums.dart';
import 'package:justthelyrics/ui/widgets/lyricas_appbar.dart';

class AlbumInfoPage extends StatelessWidget {
  const AlbumInfoPage({
    Key? key,
  }) : super(key: key);
  static String url = '/album_info';

  @override
  Widget build(BuildContext context) {
    try {
      final albumInfo =
          ModalRoute.of(context)?.settings.arguments as TopAlbumInfo;
      return AlbumInfoView(albumInfo: albumInfo);
    } catch (e) {
      final settings =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return AlbumInfoView(settings: settings);
    }
  }
}

// ignore: must_be_immutable
class AlbumInfoView extends StatefulWidget {
  AlbumInfoView({Key? key, this.albumInfo, this.settings}) : super(key: key);
  final TopAlbumInfo? albumInfo;
  Map<String, dynamic>? settings;

  @override
  State<AlbumInfoView> createState() => _AlbumInfoViewState();
}

class _AlbumInfoViewState extends State<AlbumInfoView>
    with AfterLayoutMixin<AlbumInfoView> {
  final LastFmImageSize size = LastFmImageSize();
  String _albumName = "";
  String _artistName = "";
  @override
  void initState() {
    if (widget.albumInfo != null) {
      _albumName = widget.albumInfo!.name!;
      _artistName = widget.albumInfo!.artist!.name!;
    } else {
      _albumName = widget.settings!['albumName'];
      _artistName = widget.settings!['artistName'];
    }
    AlbumImagesBlocProvider(context).e.add(ToInitialStateRequested());

    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    AlbumTracksBlocProvider(context)
        .e
        .add(AlbumInfoTrackRequested(artist: _artistName, album: _albumName));
    AlbumWikiBlocProvider(context)
        .e
        .add(AlbumWikiInfoRequested(artist: _artistName, album: _albumName));
    AlbumImagesBlocProvider(context)
        .e
        .add(ImagesOfAlbumRequested(artist: _artistName, album: _albumName));
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
                          routeName: AlbumInfoPage.url,
                          title: _artistName,
                          leftIcon: ImagesUri(TheIcon.backarrow).getIcon(),
                          onLeftClick: () => {Navigator.pop(context)},
                        )),
                    Expanded(
                      child: CustomScrollView(slivers: [
                        SliverAppBar(
                          leading: Container(),
                          expandedHeight: 450.h,
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
                              AlbumImageBlocBuilder(),
                            ]),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                child: BlocBuilder<FontScaleBloc,
                                    FontScaleBlocState>(
                                  builder: (fontscale_ctx, font_state) {
                                    double _fontScale = 1.0;
                                    if (font_state is FontScaleUpdated) {
                                      _fontScale = 1.0 / font_state.fontScale;
                                    }
                                    return albumNameHeaderText(_albumName,
                                        fontScale: _fontScale);
                                  },
                                ),
                              )),
                              AlbumInfoBlocBuilderWrapper(
                                  artistName: _artistName),
                              const AlbumWikiBlocBuilder(),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ]))),
    );
  }
}

Container albumNameHeaderText(String text, {required double fontScale}) {
  double _maxFont = ((42 / fontScale) > 11) ? (42 / fontScale) : 12;
  int maxFont = _maxFont.toInt();
  double fontSize = maxFont.sp;
  double fontHeight = (48 / fontScale).h;
  double fontHeightFactor = fontHeight / fontSize;
  return Container(
    child: Column(
      children: [
        AutoSizeText(
          text,
          style: GoogleFonts.poiretOne(
            textStyle: TextStyle(
                fontSize: fontSize,
                height: fontHeightFactor.h,
                fontWeight: FontWeight.w600),
          ),
          maxFontSize: maxFont.toDouble(),
          maxLines: 1,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 72.w),
            child: Divider(height: 8.h))
      ],
    ),
  );
}
