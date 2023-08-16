import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/prefered_stored/preferredstored_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/i18n/strings.g.dart';
import 'package:justthelyrics/ui/image_uri.dart';
import 'package:justthelyrics/ui/widgets/lyricas_appbar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);
  static String url = '/settings';

  @override
  Widget build(BuildContext context) {
    bool preferStore = getSharedPrefrerredMode();

    final Size screenSize = MediaQuery.of(context).size;
    ThemeMode themeMode =
        ModalRoute.of(context)?.settings.arguments as ThemeMode;

    return Scaffold(
      appBar: null,
      body: SafeArea(
        top: true,
        bottom: true,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            PreferredSize(
              preferredSize: Size(screenSize.width, 16.0),
              child: LyrikAppBar(
                  routeName: SettingsPage.url,
                  title: "Settings",
                  leftIcon: ImagesUri(TheIcon.backarrow).getIcon(),
                  onLeftClick: () => {Navigator.pop(context)}),
            ),
            BlocBuilder<ThememodeBloc, ThememodeState>(
                builder: (context, state) {
              if (state is ThemeModeDark) {
                themeMode = ThemeMode.dark;
              } else {
                themeMode = ThemeMode.light;
              }
              var _value = 1.0;
              return Column(children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 8.w,
                  ),
                  child: SwitchListTile(
                      title: Text(t.darkmode),
                      subtitle: Text(t.toggleonoff),
                      contentPadding: const EdgeInsets.all(8),
                      value: themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        ThememodeBlocProvider(context).e.add(ThemeModeChanged(
                            value ? ThemeMode.light : ThemeMode.dark));
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0.w, 0.h, 24.w, 0),
                  child: Divider(
                    thickness: 1,
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 8.w,
                  ),
                  child: BlocBuilder<PreferredstoredBloc, PreferredstoredState>(
                    builder: (context, state) {
                      if (state is PreferredStoredOn) {
                        preferStore = true;
                      } else if (state is PreferredStoredOff) {
                        preferStore = false;
                      }

                      return SwitchListTile(
                          title: Text(t.preferedstored),
                          subtitle: Text(t.preferredstoredsubtitle),
                          contentPadding: const EdgeInsets.all(8),
                          value: preferStore,
                          onChanged: (value) {
                            PreferredstoredBlocProvider(context)
                                .e
                                .add(PreferredStoredChanged(value));
                          });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0.w, 0.h, 24.w, 0),
                  child: Divider(
                    thickness: 1,
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                BlocBuilder<FontScaleBloc, FontScaleBlocState>(
                  builder: (font_ctx, font_state) {
                    if (font_state is FontScaleUpdated) {
                      _value = font_state.fontScale;
                    }
                    return Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Font Scale',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _value = 1.0;
                                  FontScaleBlocProvider(context)
                                      .e
                                      .add(FontScaleChanged(fontScale: _value));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 16.w),
                                  child: SvgPicture.asset(
                                    ImagesUri(TheIcon.close).getIcon(),
                                    color: (themeMode == ThemeMode.dark)
                                        ? Colors.white70
                                        : Colors.black87,
                                    width: 16.w,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SfSlider(
                            min: 0.75,
                            max: 2.1,
                            value: _value,
                            interval: 0.5,
                            showTicks: false,
                            showLabels: false,
                            enableTooltip: false,
                            minorTicksPerInterval: 0,
                            onChanged: (dynamic value) {
                              FontScaleBlocProvider(context).e.add(
                                  FontScaleChanged(
                                      fontScale: value.toDouble()));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Example:',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          BlocBuilder<FontScaleBloc, FontScaleBlocState>(
                            builder: (fontscale_ctx, font_state) {
                              double _fontScale = 1.0;
                              if (font_state is FontScaleUpdated) {
                                _fontScale = 1.0 / font_state.fontScale;
                              }
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  kItsnice,
                                  style: TextStyle(
                                    fontSize: (16 / _fontScale).sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ]));
                  },
                ),
              ]);
            }),
          ]),
        ),
      ),
    );
  }
}
/*  */
