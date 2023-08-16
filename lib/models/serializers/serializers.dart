import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:justthelyrics/models/album_images.dart';
import 'package:justthelyrics/models/album_of_a_track.dart';
import 'package:justthelyrics/models/album_ovh.dart';
import 'package:justthelyrics/models/album_topalbums.dart';
import 'package:justthelyrics/models/artist_similar.dart';
import 'package:justthelyrics/models/search_ovh_result.dart';
import 'package:justthelyrics/models/track_ovh_search.dart';

import 'package:justthelyrics/models/wiki_info.dart';
import 'package:justthelyrics/models/album_info.dart';
import 'package:justthelyrics/models/artist_info.dart';
import 'package:justthelyrics/models/image.dart';
import 'package:justthelyrics/models/artist_topalbums.dart';
import 'package:justthelyrics/models/track.dart';
import 'package:justthelyrics/models/track_from_search.dart';
import 'package:justthelyrics/models/track_search_results.dart';

part 'serializers.g.dart';

@SerializersFor([
  Image,
  ArtistInfo,
  Track,
  AlbumTracks,
  TopAlbumInfo,
  TopAlbums,
  WikiInfo,
  TrackSearchResult,
  TrackSearch,
  AlbumImages,
  ArtistSimilar,
  AlbumOfTheTrack,
  TrackOvhSearchResult,
  TrackOvhSearch,
  AlbumOvhInfo
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
