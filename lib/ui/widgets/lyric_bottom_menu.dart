import 'package:auto_size_text/auto_size_text.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/blocs/current_pageview/currentpageview_bloc.dart';
import 'package:justthelyrics/models/bottom_menu_item.dart';
import 'package:justthelyrics/models/bottom_menu_item_list.dart';

class LyricaBottomMenu extends StatelessWidget {
  final BottomMenuList menu;
  final int currentPage;

  const LyricaBottomMenu({
    Key? key,
    required this.menu,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxFont = 18;

    double fontSize = maxFont.sp;
    double fontHeight = 20.h;
    double fontHeightFactor = fontHeight / fontSize;

    CurrentpageviewBloc currentPageBloc =
        BlocProvider.of<CurrentpageviewBloc>(context);
    final colorScheme = Theme.of(context).colorScheme;
    BuiltList<BottomMenuItem> items = menu.items!;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: BlocBuilder<CurrentpageviewBloc, CurrentpageviewState>(
          builder: (context, state) {
            if (state is CurrentPage) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(items.length, (index) {
                  final bool isActive = index == state.currentPage;
                  final BottomMenuItem item = items[index];
                  return Expanded(
                      child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => currentPageBloc.add(CurrentChanged(index)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(item.iconPath!,
                            width: 24,
                            color: isActive ? Colors.red : colorScheme.primary),
                        const SizedBox(height: 5),
                        AutoSizeText(
                          item.label!,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poiretOne(
                            textStyle: TextStyle(
                              fontSize: fontSize,
                              color:
                                  isActive ? Colors.red : colorScheme.primary,
                              height: fontHeightFactor.h,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          maxFontSize: maxFont,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ));
                }),
              );
            } else {
              return Container();
            }
          },
        )),
      ),
    );
  }
}
