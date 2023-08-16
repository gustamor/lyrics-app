import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/ui/widgets/lyricas_appbar.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);
  static String url = '/aboutus';
  @override
  Widget build(BuildContext context) {
    ThemeMode _currentTheme;

    return Scaffold(
        appBar: null,
        body: SafeArea(
            top: true,
            bottom: true,
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: BlocBuilder<ThememodeBloc, ThememodeState>(
                    builder: (context, state) {
                  if (state is ThemeModeDark) {
                    _currentTheme = ThemeMode.dark;
                  } else if (state is ThemeModeLight) {
                    _currentTheme = ThemeMode.light;
                  } else {
                    _currentTheme = ThemeMode.light;
                  }

                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LyrikAppBar(
                            routeName: AboutUsPage.url,
                            title: 'About us',
                            leftIcon: ImagesUri(TheIcon.backarrow).getIcon(),
                            onLeftClick: () => {Navigator.pop(context)}),
                        SizedBox(
                          height: 30.h,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: aboutText(
                                kAboutText(devname: kDevName, devemail: kDevEmailAddress),
                                (_currentTheme == ThemeMode.dark)
                                    ? Colors.amber
                                    : Colors.black54),
                          ),
                        ),
                      ]);
                }))));
  }
}

Text aboutText(String content, Color color) {
  double maxFont = 18;

  double fontSize = maxFont.sp;
  double fontHeight = 24.h;
  double fontHeightFactor = fontHeight / fontSize;
  return Text(
    content,
    textAlign: TextAlign.left,
    style: GoogleFonts.ubuntu(
      textStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          height: fontHeightFactor.h,
          fontWeight: FontWeight.w600),
    ),
  );
}
