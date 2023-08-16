import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/models/databaseclasses.dart';
import 'package:justthelyrics/ui/pages/lyrics_of_track_page.dart';
import 'package:justthelyrics/ui/widgets/image_network.dart';

class TrackCard extends StatefulWidget {
  const TrackCard({Key? key, required this.track}) : super(key: key);
  final TrackDos track;

  @override
  State<TrackCard> createState() => _TrackCardState();
}

class _TrackCardState extends State<TrackCard> {
  final LastFmImageSize size = LastFmImageSize();

  String _url = "";

  /*  Future<void> getAlbumImageUrl(TrackDos track) async {
    String url = await LyricsDB().albumCoverUrl(track.albumId!);
    print(url.toString());
    setState(() {
      _url = url;
    });
  }
 */
  @override
  void initState() {
    //  getAlbumImageUrl(widget.track);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> artistNameTitle = {
      'artist': widget.track.artist!,
      'title': widget.track.title!
    };

    return ListTile(
        title: Text(widget.track.title!),
        subtitle: Text(widget.track.artist!),
        leading: ImageNetwork(
          url: _url,
          width: 60,
          height: 60,
        ),
        onTap: () => {
              Navigator.pushReplacementNamed(context, LyricsOfTrackPage.url,
                  arguments: artistNameTitle)
            });
  }
}

AutoSizeText TitleText(String text) {
  double maxFont = 16;

  double fontSize = maxFont.sp;
  double fontHeight = 24.h;
  double fontHeightFactor = fontHeight / fontSize;
  return AutoSizeText(
    text,
    textAlign: TextAlign.left,
    style: GoogleFonts.poiretOne(
      textStyle: TextStyle(
          fontSize: fontSize,
          height: fontHeightFactor.h,
          fontWeight: FontWeight.w700),
    ),
    maxFontSize: maxFont,
    maxLines: 1,
  );
}

AutoSizeText subTitleText(String text, {required double fontScale}) {
  double maxFont = 15;

  double fontSize = maxFont.sp;
  double fontHeight = 24.h;
  double fontHeightFactor = fontHeight / fontSize;
  return AutoSizeText(
    text,
    textAlign: TextAlign.left,
    style: GoogleFonts.poiretOne(
      textStyle: TextStyle(
          fontSize: fontSize,
          height: fontHeightFactor.h,
          fontWeight: FontWeight.w500),
    ),
    maxFontSize: maxFont,
    maxLines: 1,
  );
}
