// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_from_search.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TrackSearch> _$trackSearchSerializer = new _$TrackSearchSerializer();

class _$TrackSearchSerializer implements StructuredSerializer<TrackSearch> {
  @override
  final Iterable<Type> types = const [TrackSearch, _$TrackSearch];
  @override
  final String wireName = 'TrackSearch';

  @override
  Iterable<Object?> serialize(Serializers serializers, TrackSearch object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.mbid;
    if (value != null) {
      result
        ..add('mbid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.artist;
    if (value != null) {
      result
        ..add('artist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.album;
    if (value != null) {
      result
        ..add('album')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TopAlbumInfo)));
    }
    value = object.lyricFound;
    if (value != null) {
      result
        ..add('lyricFound')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  TrackSearch deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrackSearchBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'mbid':
          result.mbid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'artist':
          result.artist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'album':
          result.album.replace(serializers.deserialize(value,
              specifiedType: const FullType(TopAlbumInfo))! as TopAlbumInfo);
          break;
        case 'lyricFound':
          result.lyricFound = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$TrackSearch extends TrackSearch {
  @override
  final String? mbid;
  @override
  final String? artist;
  @override
  final String? name;
  @override
  final TopAlbumInfo? album;
  @override
  final bool? lyricFound;

  factory _$TrackSearch([void Function(TrackSearchBuilder)? updates]) =>
      (new TrackSearchBuilder()..update(updates))._build();

  _$TrackSearch._(
      {this.mbid, this.artist, this.name, this.album, this.lyricFound})
      : super._();

  @override
  TrackSearch rebuild(void Function(TrackSearchBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackSearchBuilder toBuilder() => new TrackSearchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackSearch &&
        mbid == other.mbid &&
        artist == other.artist &&
        name == other.name &&
        album == other.album &&
        lyricFound == other.lyricFound;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mbid.hashCode);
    _$hash = $jc(_$hash, artist.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, album.hashCode);
    _$hash = $jc(_$hash, lyricFound.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TrackSearch')
          ..add('mbid', mbid)
          ..add('artist', artist)
          ..add('name', name)
          ..add('album', album)
          ..add('lyricFound', lyricFound))
        .toString();
  }
}

class TrackSearchBuilder implements Builder<TrackSearch, TrackSearchBuilder> {
  _$TrackSearch? _$v;

  String? _mbid;
  String? get mbid => _$this._mbid;
  set mbid(String? mbid) => _$this._mbid = mbid;

  String? _artist;
  String? get artist => _$this._artist;
  set artist(String? artist) => _$this._artist = artist;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  TopAlbumInfoBuilder? _album;
  TopAlbumInfoBuilder get album => _$this._album ??= new TopAlbumInfoBuilder();
  set album(TopAlbumInfoBuilder? album) => _$this._album = album;

  bool? _lyricFound;
  bool? get lyricFound => _$this._lyricFound;
  set lyricFound(bool? lyricFound) => _$this._lyricFound = lyricFound;

  TrackSearchBuilder();

  TrackSearchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mbid = $v.mbid;
      _artist = $v.artist;
      _name = $v.name;
      _album = $v.album?.toBuilder();
      _lyricFound = $v.lyricFound;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TrackSearch other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TrackSearch;
  }

  @override
  void update(void Function(TrackSearchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TrackSearch build() => _build();

  _$TrackSearch _build() {
    _$TrackSearch _$result;
    try {
      _$result = _$v ??
          new _$TrackSearch._(
              mbid: mbid,
              artist: artist,
              name: name,
              album: _album?.build(),
              lyricFound: lyricFound);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'album';
        _album?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TrackSearch', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
