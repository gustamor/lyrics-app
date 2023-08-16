// ignore_for_file: must_be_immutable

import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';

class LyrikAppBar extends StatefulWidget {
  final String routeName;
  String? title;
  String? leftIcon;
  double? leftIconSize;
  String? rightIcon;
  double? rightIconSize;

  VoidCallback? onLeftClick, onRightClick;

  LyrikAppBar(
      {Key? key,
      required this.routeName,
      this.title,
      this.leftIcon,
      this.leftIconSize,
      this.rightIcon,
      this.rightIconSize,
      this.onLeftClick,
      this.onRightClick})
      : super(key: key);

  @override
  State<LyrikAppBar> createState() => _LyrikAppBarState();
}

class _LyrikAppBarState extends State<LyrikAppBar>
    with AfterLayoutMixin<LyrikAppBar> {
  @override
  void afterFirstLayout(BuildContext context) {
    ThememodeBlocProvider(context).e.add(CurrentThemeRequested());
  }

  @override
  Widget build(BuildContext context) {
    late ThemeMode _themeMode;
    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.leftIcon != null
              ? Expanded(
                  flex: 3,
                  child: BlocBuilder<ThememodeBloc, ThememodeState>(
                    builder: (context, state) {
                      if (state is ThemeModeDark) {
                        _themeMode = ThemeMode.dark;
                      } else if (state is ThemeModeLight) {
                        _themeMode = ThemeMode.light;
                      } else {
                        return Container();
                      }
                      return CupertinoButton(
                        onPressed: widget.onLeftClick,
                        padding: EdgeInsets.all(16.h),
                        child: SvgPicture.asset(
                          widget.leftIcon!,
                          color: (_themeMode == ThemeMode.dark)
                              ? const Color.fromARGB(255, 221, 221, 221)
                              : const Color.fromARGB(230, 26, 26, 26),
                          width: widget.leftIconSize ?? 40.h,
                          height: widget.leftIconSize ?? 40.h,
                        ),
                      );
                    },
                  ),
                )
              : SizedBox(
                  width: ScreenUtil().setWidth(40),
                ),
          Row(
            children: [
              widget.title != null
                  ? SizedBox(
                      width: 250.w,
                      child: Center(
                        child: appBarHeaderText(
                          widget.title!,
                        ),
                      ),
                    )
                  : Expanded(child: appBarHeaderText('Lyricas')),
            ],
          ),
          widget.rightIcon != null
              ? Expanded(
                  flex: 3,
                  child: BlocBuilder<ThememodeBloc, ThememodeState>(
                    builder: (context, state) {
                      if (state is ThemeModeDark) {
                        _themeMode = ThemeMode.dark;
                      } else {
                        _themeMode = ThemeMode.light;
                      }
                      return CupertinoButton(
                        onPressed: widget.onRightClick,
                        padding:
                            const EdgeInsets.only(left: 8, right: 4, top: 8),
                        child: SvgPicture.asset(
                          widget.rightIcon!,
                          color: (_themeMode == ThemeMode.dark)
                              ? const Color.fromARGB(255, 221, 221, 221)
                              : const Color.fromARGB(230, 26, 26, 26),
                          width: widget.rightIconSize ?? 28.w,
                          height: widget.rightIconSize ?? 28.h,
                        ),
                      );
                    },
                  ),
                )
              : Expanded(flex: 3, child: SizedBox(width: 57.w)),
        ],
      ),
    );
  }
}

AutoSizeText appBarHeaderText(String text) {
  double _fontSize = 32.sp;
  double _lineHeight = 32.h;
  double _lineHeightFactor = _lineHeight / _fontSize;

  return AutoSizeText(
    text,
    style: GoogleFonts.poiretOne(
      textStyle: TextStyle(
        fontFamily: 'Lato',
        fontSize: _fontSize,
        height: _lineHeightFactor,
        fontWeight: FontWeight.w800,
      ),
    ),
    minFontSize: 18,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
