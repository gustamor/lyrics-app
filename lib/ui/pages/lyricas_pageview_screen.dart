import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justthelyrics/blocs/current_pageview/currentpageview_bloc.dart';
import 'package:justthelyrics/services/native_inline_ad.dart';

class LyricasPageView extends StatefulWidget {
  const LyricasPageView(
      {Key? key,
      required this.startPage,
      // required this.currentPage,
      required this.pages})
      : assert(pages.length >= 0),
        super(key: key);

  final int startPage;
  // final int currentPage;
  final List<Widget> pages;

  @override
  State<LyricasPageView> createState() => _LyricasPageViewState();
}

class _LyricasPageViewState extends State<LyricasPageView> {
  final List<int> _renderedPages = <int>[];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentpageviewBloc, CurrentpageviewState>(
        builder: (context, state) {
      if (state is CurrentPage) {
        if (!_renderedPages.contains(state.currentPage)) {
          _renderedPages.add(state.currentPage);
        }

        return IndexedStack(
          children: List.generate(widget.pages.length, (index) {
            return (_renderedPages.contains(index) || index == widget.startPage)
                ? widget.pages[index]
                : Container();
          }),
          index: state.currentPage,
        );
      } else {
        return Container();
      }
    });
  }
}
