// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_ovh_search.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TrackOvhSearch> _$trackOvhSearchSerializer =
    new _$TrackOvhSearchSerializer();

class _$TrackOvhSearchSerializer
    implements StructuredSerializer<TrackOvhSearch> {
  @override
  final Iterable<Type> types = const [TrackOvhSearch, _$TrackOvhSearch];
  @override
  final String wireName = 'TrackOvhSearch';

  @override
  Iterable<Object?> serialize(Serializers serializers, TrackOvhSearch object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('title_short')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.artist;
    if (value != null) {
      result
        ..add('artist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ArtistInfo)));
    }
    value = object.album;
    if (value != null) {
      result
        ..add('album')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AlbumOvhInfo)));
    }
    return result;
  }

  @override
  TrackOvhSearch deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrackOvhSearchBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title_short':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'artist':
          result.artist.replace(serializers.deserialize(value,
              specifiedType: const FullType(ArtistInfo))! as ArtistInfo);
          break;
        case 'album':
          result.album.replace(serializers.deserialize(value,
              specifiedType: const FullType(AlbumOvhInfo))! as AlbumOvhInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$TrackOvhSearch extends TrackOvhSearch {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final ArtistInfo? artist;
  @override
  final AlbumOvhInfo? album;

  factory _$TrackOvhSearch([void Function(TrackOvhSearchBuilder)? updates]) =>
      (new TrackOvhSearchBuilder()..update(updates))._build();

  _$TrackOvhSearch._({this.id, this.name, this.artist, this.album}) : super._();

  @override
  TrackOvhSearch rebuild(void Function(TrackOvhSearchBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackOvhSearchBuilder toBuilder() =>
      new TrackOvhSearchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackOvhSearch &&
        id == other.id &&
        name == other.name &&
        artist == other.artist &&
        album == other.album;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, artist.hashCode);
    _$hash = $jc(_$hash, album.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TrackOvhSearch')
          ..add('id', id)
          ..add('name', name)
          ..add('artist', artist)
          ..add('album', album))
        .toString();
  }
}

class TrackOvhSearchBuilder
    implements Builder<TrackOvhSearch, TrackOvhSearchBuilder> {
  _$TrackOvhSearch? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ArtistInfoBuilder? _artist;
  ArtistInfoBuilder get artist => _$this._artist ??= new ArtistInfoBuilder();
  set artist(ArtistInfoBuilder? artist) => _$this._artist = artist;

  AlbumOvhInfoBuilder? _album;
  AlbumOvhInfoBuilder get album => _$this._album ??= new AlbumOvhInfoBuilder();
  set album(AlbumOvhInfoBuilder? album) => _$this._album = album;

  TrackOvhSearchBuilder();

  TrackOvhSearchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _artist = $v.artist?.toBuilder();
      _album = $v.album?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TrackOvhSearch other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TrackOvhSearch;
  }

  @override
  void update(void Function(TrackOvhSearchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TrackOvhSearch build() => _build();

  _$TrackOvhSearch _build() {
    _$TrackOvhSearch _$result;
    try {
      _$result = _$v ??
          new _$TrackOvhSearch._(
              id: id,
              name: name,
              artist: _artist?.build(),
              album: _album?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'artist';
        _artist?.build();
        _$failedField = 'album';
        _album?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TrackOvhSearch', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
