import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justthelyrics/blocs/album_images/album_images_bloc.dart';
import 'package:justthelyrics/blocs/album_info_track/album_info_track_bloc.dart';
import 'package:justthelyrics/blocs/album_wiki/album_wiki_bloc.dart';
import 'package:justthelyrics/blocs/artist_info/artist_info_bloc.dart';

import 'package:justthelyrics/blocs/current_pageview/currentpageview_bloc.dart';
import 'package:justthelyrics/blocs/favorites/favorites_bloc.dart';
import 'package:justthelyrics/blocs/font_scale/fontscalebloc_bloc.dart';
import 'package:justthelyrics/blocs/get_lyric/getlyric_bloc.dart';
import 'package:justthelyrics/blocs/internet/internet_bloc.dart';
import 'package:justthelyrics/blocs/prefered_stored/preferredstored_bloc.dart';
import 'package:justthelyrics/blocs/search_form/searchform_bloc.dart';
import 'package:justthelyrics/blocs/theme_mode/thememode_bloc.dart';

class CurrentPageViewBlocProvider {
  // ignore: prefer_typing_uninitialized_variables
  var context;
  CurrentpageviewBloc? _provider;
  CurrentPageViewBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<CurrentpageviewBloc>(context);
  }
  CurrentpageviewBloc get currentPage => _provider!;
}

class ThememodeBlocProvider {
  // ignore: prefer_typing_uninitialized_variables
  var context;
  ThememodeBloc? _provider;

  ThememodeBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<ThememodeBloc>(context);
  }
  ThememodeBloc get e => _provider!;
}

class SearchBlocProvider {
  // ignore: prefer_typing_uninitialized_variables
  var context;
  SearchBloc? _provider;

  SearchBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<SearchBloc>(context);
  }
  SearchBloc get e => _provider!;
}

class FavoritesBlocProvider {
  // ignore: prefer_typing_uninitialized_variables
  var context;
  FavoritesBloc? _provider;

  FavoritesBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<FavoritesBloc>(context);
  }
  FavoritesBloc get e => _provider!;
}

class LyricsBlocProvider {
  // ignore: prefer_typing_uninitialized_variables
  var context;
  LyricsBloc? _lyricsBloc;

  LyricsBlocProvider(
    this.context,
  ) {
    _lyricsBloc = BlocProvider.of<LyricsBloc>(context);
  }
  LyricsBloc get e => _lyricsBloc!;
}

class AlbumImagesBlocProvider {
  var context;
  AlbumImagesBloc? _provider;

  AlbumImagesBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<AlbumImagesBloc>(context);
  }
  AlbumImagesBloc get e => _provider!;
}

class ArtistInfoBlocProvider {
  var context;
  ArtistInfoBloc? _provider;

  ArtistInfoBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<ArtistInfoBloc>(context);
  }
  ArtistInfoBloc get e => _provider!;
}

class AlbumTracksBlocProvider {
  var context;
  AlbumTracksBloc? _provider;

  AlbumTracksBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<AlbumTracksBloc>(context);
  }
  AlbumTracksBloc get e => _provider!;
}

class AlbumWikiBlocProvider {
  var context;
  AlbumWikiBloc? _provider;

  AlbumWikiBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<AlbumWikiBloc>(context);
  }
  AlbumWikiBloc get e => _provider!;
}

class FontScaleBlocProvider {
  var context;
  FontScaleBloc? _provider;

  FontScaleBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<FontScaleBloc>(context);
  }
  FontScaleBloc get e => _provider!;
}
class InternetBlocProvider {
  var context;
  InternetBloc? _provider;

  InternetBlocProvider(
      this.context,
      ) {
    _provider = BlocProvider.of<InternetBloc>(context);
  }
  InternetBloc get e => _provider!;
}

class PreferredstoredBlocProvider {
  var context;
  PreferredstoredBloc? _provider;

  PreferredstoredBlocProvider(
    this.context,
  ) {
    _provider = BlocProvider.of<PreferredstoredBloc>(context);
  }
  PreferredstoredBloc get e => _provider!;
}
