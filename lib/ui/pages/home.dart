import 'dart:async';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/current_pageview/currentpageview_bloc.dart';
import 'package:justthelyrics/blocs/internet/internet_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/models/album_topalbums.dart';
import 'package:justthelyrics/models/bottom_menu_item.dart';
import 'package:justthelyrics/models/bottom_menu_item_list.dart';
import 'package:justthelyrics/ui/pages/favorite_songs_page.dart';
import 'package:justthelyrics/ui/pages/lyricas_pageview_screen.dart';
import 'package:justthelyrics/ui/pages/search_page.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/ui/widgets/lyric_bottom_menu.dart';
import 'package:justthelyrics/ui/widgets/lyric_dialog.dart';
import 'package:justthelyrics/ui/widgets/lyric_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<ScaffoldState>? drawerKey = GlobalKey();

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  static String url = '/home';
  HomePage(
      {Key? key,
      this.adsFunction,
      required this.themeMode,
      required this.onThemeModeChanged,
      required this.flexSchemeData})
      : super(key: key);
  final VoidCallback? adsFunction;
  ThemeMode themeMode;
  final Function onThemeModeChanged;
  final FlexSchemeData flexSchemeData;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _currentPage = 1;
  BuiltList<TopAlbumInfo>? topAlbums = BuiltList<TopAlbumInfo>();

  static final BottomMenuList _menu = BottomMenuList(
    (b) => b
      ..items = ListBuilder<BottomMenuItem>([
        BottomMenuItem((b) => b
          ..iconPath = 'assets/icons/heart.svg'
          ..label = kFavorites
          ..content = FavoritesSongsPage()),
        BottomMenuItem((b) => b
          ..iconPath = 'assets/icons/search.svg'
          ..label = kSearch
          ..content = SearchPage()),
      ]),
  );

  bool isLoaded = false;
  int _startPage = 1;
  DateTime? currentBackPressTime;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<bool> onWillPop() async {
    //if (_currentPage == 2) return Future.value(false);
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool _isRatingCanceled = _prefs.getBool(kprefRatingDialogCanceled) ?? false;

    if (Remote.exitMessageEnabled == true && _isRatingCanceled == false) {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;

        bool answer = await Dialogs.exit(context,
            title: kWantExit,
            rateText: Remote.exitMessage ?? kExitMessage,
            confirmText: kYes,
            cancelText: kStayHere);

        return Future.value(false);
      }
      return Future.value(true);
    } else {
      return Future.value(true);
    }
  }

  @override
  void initState() {
    super.initState();

    /*try {
      if (Remote.isAds == true &&
          Remote.interstitialInit == true &&
          widget.adsFunction != null) {
        widget.adsFunction!();
        //  Remote.count++;
      }
    } catch (e) {}*/

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    CurrentPageViewBlocProvider(context).currentPage.add(InitialPage());
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
      InternetBlocProvider(context).e.add(InternetInit(result));
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      if (_connectionStatus == ConnectivityResult.none) {
        InternetBlocProvider(context).e.add(InternetDisconnectedEvent());

        final snackBar = SnackBar(
          content: Text(kInternetDisconnted,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 13.sp))),
          duration: const Duration(seconds: 5),
          elevation: 1,
          backgroundColor: Colors.green[800],
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        InternetBlocProvider(context).e.add(InternetConnectedEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      CurrentPageViewBlocProvider(context)
          .currentPage
          .add(CurrentChanged(_currentPage));

      isLoaded = true;
    }

    return BlocBuilder<CurrentpageviewBloc, CurrentpageviewState>(
      builder: (context, state) {
        if (state is CurrentpageviewInitial) {
          _startPage = 1;
        }
        if (state is CurrentPage) {
          return Scaffold(
              key: drawerKey,
              drawer: const LyricDrawer(),
              bottomNavigationBar: LyricaBottomMenu(
                currentPage: state.currentPage,
                menu: _menu,
              ),
              resizeToAvoidBottomInset: false,
              body: WillPopScope(
                onWillPop: onWillPop,
                child: SafeArea(
                  top: true,
                  bottom: true,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: LyricasPageView(
                              startPage: _startPage,
                              pages: _menu.items!
                                  .map<Widget>((item) => item.content!)
                                  .toList(),
                            ),
                          ),
                        ]),
                  ),
                ),
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
