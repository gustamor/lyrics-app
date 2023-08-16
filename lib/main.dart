import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_funding_choices/flutter_funding_choices.dart' as ump;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/internet/internet_bloc.dart';
import 'package:justthelyrics/blocs/prefered_stored/preferredstored_bloc.dart';
import 'package:justthelyrics/i18n/strings.g.dart';
import 'package:justthelyrics/models/storedSongs.dart';
import 'package:justthelyrics/services/ad_services.dart';
import 'package:justthelyrics/ui/pages/aboutus.dart';
import 'package:justthelyrics/ui/pages/lyrics_hive_page.dart';
import 'package:justthelyrics/remote_config.dart';
import 'package:justthelyrics/services/repositories/push_notifications_repository.dart';
import 'package:justthelyrics/secrets.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justthelyrics/blocs/favorites/favorites_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';
import 'package:justthelyrics/blocs/album_images/album_images_bloc.dart';
import 'package:justthelyrics/blocs/album_info_track/album_info_track_bloc.dart';
import 'package:justthelyrics/blocs/album_wiki/album_wiki_bloc.dart';
import 'package:justthelyrics/blocs/artist_info/artist_info_bloc.dart';
import 'package:justthelyrics/blocs/current_pageview/currentpageview_bloc.dart';
import 'package:justthelyrics/blocs/get_lyric/getlyric_bloc.dart';
import 'package:justthelyrics/blocs/search_form/searchform_bloc.dart';
import 'package:justthelyrics/global.dart';
import 'package:justthelyrics/ui/pages/album_info_page.dart';
import 'package:justthelyrics/ui/pages/album_tracks_page.dart';
import 'package:justthelyrics/ui/pages/favorite_songs_page.dart';
import 'package:justthelyrics/ui/pages/lyrics_of_track_page.dart';
import 'package:justthelyrics/ui/pages/search_page.dart';
import 'package:justthelyrics/ui/pages/settings_page.dart';
import 'package:justthelyrics/ui/pages/top_albums_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'ui/pages/home.dart';

late SharedPreferences prefs;
const int maxFailedLoadAttempts = 3;

String get interstitialAdUnitId {
  if (Remote.adInterId != null) {
    return Remote.adInterId!;
  } else {
    return "";
  }
}

Future<void> getRemoteConfig() async {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  await AppOpenAdManager.loadAd();
  WidgetsBinding.instance
      .addObserver(AppLifecycleReactor(appOpenAdManager: AppOpenAdManager()));
  _remoteConfig.setConfigSettings(RemoteConfigSettings(
    minimumFetchInterval: const Duration(seconds: 10),
    fetchTimeout: const Duration(seconds: 10),
  ));

  await _remoteConfig.fetchAndActivate();

  Remote.isAds = _remoteConfig.getBool('isAds');
  (_remoteConfig.getInt('interFreq') == 0)
      ? Remote.interFreq = 10000
      : Remote.interFreq = _remoteConfig.getInt('interFreq');
  Remote.interstitialInit = _remoteConfig.getBool('splashInter');

  Remote.adInterId = _remoteConfig.getString('AdInterId');
  Remote.adNativeBannerId = _remoteConfig.getString('adNativeBannerId');
  Remote.adOpenAdId = _remoteConfig.getString('adNativeBannerId');
  Remote.openAdEnabled = _remoteConfig.getBool("openAdEnabled");
  Remote.adNativeFreqInList = _remoteConfig.getInt("adNativeFreqInList");

  Remote.rampageIntersOn = _remoteConfig.getBool('rampageIntersO');
  Remote.toLyricsPageInterOn = _remoteConfig.getBool('toLyricsPageInterOn');
  Remote.fromSearchPageToLyricsPageInterOn =
      _remoteConfig.getBool('fromSearchPageToLyricsPageInterOn');
  Remote.fromLyrycToAlbumInterOn =
      _remoteConfig.getBool('fromLyrycToAlbumInterOn');
  Remote.fromLyrycToTopAlbumsPageInterOn =
      _remoteConfig.getBool('fromLyrycToTopAlbumsPageInterOn');
  Remote.fromTopAlbumItemToAlbumInterOn =
      _remoteConfig.getBool('fromTopAlbumItemToAlbumInterOn');
  Remote.fromTitleItemToLyricInterOn =
      _remoteConfig.getBool('fromTitleItemToLyricInterOn');
  Remote.fromFavoriteItemToLyricInterOn =
      _remoteConfig.getBool('fromFavoriteItemToLyricInterOn');
  Remote.imagenSearchPage = _remoteConfig.getBool('imagenSearchPage');
  Remote.imagenFavoritesPage = _remoteConfig.getBool('imagenFavoritesPage');
  Remote.imagenNotFoundWidget = _remoteConfig.getBool('imagenNotFoundWidget');
  Remote.rateMinDays = _remoteConfig.getInt('rateMinDays');
  Remote.rateMinLaunches = _remoteConfig.getInt('rateMinLaunches');
  Remote.rateRemindDays = _remoteConfig.getInt('rateRemindDays');
  Remote.rateRemindLaunches = _remoteConfig.getInt('rateRemindLaunches');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    ump.ConsentInformation consentInfo =
        await ump.FlutterFundingChoices.requestConsentInformation();

    if (consentInfo.isConsentFormAvailable &&
        consentInfo.consentStatus == ConsentStatus.required) {
      await ump.FlutterFundingChoices.showConsentForm();
      // You can check the result by calling `FlutterFundingChoices.requestConsentInformation()` again !
    }
  });
  LocaleSettings.useDeviceLocale(); // and this
  prefs = await SharedPreferences.getInstance();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
      testDeviceIds: [
        "CFD3B109C54FAB3D05CC7D2EF42DE8DD",
        "B3EEABB8EE11C2BE770B684D95219ECB"
      ]));

  try {
    await getRemoteConfig();
  } catch (e) {}

  HttpOverrides.global = MyHttpOverrides();

  Hive
    ..init(appDocPath)
    ..registerAdapter(StoredSongAdapter());
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CurrentpageviewBloc>(
        create: (context) => CurrentpageviewBloc(),
      ),
      BlocProvider<AlbumImagesBloc>(
        create: (context) => AlbumImagesBloc(),
      ),
      BlocProvider<ArtistInfoBloc>(
        create: (context) => ArtistInfoBloc(),
      ),
      BlocProvider<AlbumTracksBloc>(
        create: (context) => AlbumTracksBloc(),
      ),
      BlocProvider<AlbumWikiBloc>(
        create: (context) => AlbumWikiBloc(),
      ),
      BlocProvider<AlbumTracksBloc>(
        create: (context) => AlbumTracksBloc(),
      ),
      BlocProvider<LyricsBloc>(
        create: (context) => LyricsBloc(),
      ),
      BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(),
      ),
      BlocProvider<FavoritesBloc>(
        create: (context) => FavoritesBloc(),
      ),
      BlocProvider<ThememodeBloc>(
        create: (context) => ThememodeBloc(),
      ),
      BlocProvider<FontScaleBloc>(
        create: (context) => FontScaleBloc(),
      ),
      BlocProvider<InternetBloc>(
        create: (context) => InternetBloc(),
      ),
      BlocProvider<PreferredstoredBloc>(
        create: (context) => PreferredstoredBloc(),
      ),
    ],
    child: TranslationProvider(child: const LyricsApp()),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class LyricsApp extends StatefulWidget {
  const LyricsApp({Key? key}) : super(key: key);
  @override
  State<LyricsApp> createState() => _LyricsAppState();
}

class _LyricsAppState extends State<LyricsApp> {
  late ThemeMode _themeMode;

  Future<void> setThemeMode() async {
    var _t = prefs.getInt("themeMode");
    late var _mode;
    if (_t == null || _t == TheMode().light) {
      ThememodeBlocProvider(context).e.add(ThememodeEventInit(ThemeMode.light));
      _mode = ThemeMode.light;
    } else if (_t == TheMode().dark) {
      ThememodeBlocProvider(context).e.add(ThememodeEventInit(ThemeMode.dark));
      _mode = ThemeMode.dark;
    } else {
      ThememodeBlocProvider(context).e.add(ThememodeEventInit(ThemeMode.light));
      _mode = ThemeMode.light;
    }
    setState(() {
      _themeMode = _mode;
    });
  }

  Future<void> setFontScale() async {
    var _size = prefs.getDouble("fontScale") ?? 1.0;
    FontScaleBlocProvider(context).e.add(FontScaleChanged(fontScale: _size));
  }

  @override
  void dispose() {
    interstitialDispose();
    super.dispose();
  }

  @override
  void initState() {
    setThemeMode();
    super.initState();

    if (Remote.interstitialInit == true) loadInterstitialAd();

    final pushNotificationsRepositoryImpl =
        PushNotificationsRepositoryImpl(OneSignal.shared);
    pushNotificationsRepositoryImpl.initialize(kOneSignalID);
    setFontScale();
  }

  @override
  Widget build(BuildContext context) {
    const FlexScheme usedScheme = FlexScheme.outerSpace;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    AppOpenAdManager.showAdIfAvailable();
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, state) {
        return BlocBuilder<ThememodeBloc, ThememodeState>(
          builder: (context, state) {
            if (state is ThemeModeDark) {
              _themeMode = ThemeMode.dark;
            } else if (state is ThemeModeLight) {
              _themeMode = ThemeMode.light;
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale:
                  TranslationProvider.of(context).flutterLocale, // use provider
              supportedLocales: LocaleSettings.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              title: 'The Lyrics',
              home: SplashScreenView(
                navigateRoute: HomePage(
                  adsFunction: showInterstitialAd,
                  themeMode: _themeMode,
                  onThemeModeChanged: (ThemeMode mode) {},
                  flexSchemeData: FlexColor.schemes[usedScheme]!,
                ),
                duration: 6000,
                imageSize: 152,
                text: "Song Lyrics",
                imageSrc: "assets/images/splash.webp",
                colors: const [
                  Color.fromARGB(255, 2, 0, 2),
                ],
                backgroundColor: (_themeMode == ThemeMode.dark)
                    ? Color.fromARGB(255, 0, 0, 0)
                    : Color.fromARGB(255, 255, 255, 255),
              ),
              theme: FlexThemeData.light(
                scheme: usedScheme,
                appBarElevation: 0.5,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                fontFamily: GoogleFonts.poiretOne().fontFamily,
              ),
              darkTheme: FlexThemeData.dark(
                scheme: usedScheme,
                appBarElevation: 2,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                fontFamily: GoogleFonts.poiretOne().fontFamily,
              ),
              themeMode: _themeMode,
              routes: {
                HomePage.url: (context) => HomePage(
                      themeMode: _themeMode,
                      onThemeModeChanged: (ThemeMode mode) {},
                      flexSchemeData: FlexColor.schemes[usedScheme]!,
                    ),
                SearchPage.url: (context) => SearchPage(),
                AlbumInfoPage.url: (context) => const AlbumInfoPage(),
                AlbumTracksPage.url: (context) => const AlbumTracksPage(),
                FavoritesSongsPage.url: (context) => FavoritesSongsPage(),
                TopAlbumsPage.url: (context) => const TopAlbumsPage(),
                LyricsOfTrackPage.url: (context) => const LyricsOfTrackPage(),
                LyricsHivePage.url: (context) => const LyricsHivePage(),
                SettingsPage.url: (context) => const SettingsPage(),
                AboutUsPage.url: (context) => const AboutUsPage(),
              },
            );
          },
        );
      },
    );
  }
}
