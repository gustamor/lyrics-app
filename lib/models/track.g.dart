// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Track> _$trackSerializer = new _$TrackSerializer();

class _$TrackSerializer implements StructuredSerializer<Track> {
  @override
  final Iterable<Type> types = const [Track, _$Track];
  @override
  final String wireName = 'Track';

  @override
  Iterable<Object?> serialize(Serializers serializers, Track object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.albumOfTrack;
    if (value != null) {
      result
        ..add('albumOfTrack')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AlbumOfTheTrack)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.artistName;
    if (value != null) {
      result
        ..add('artistName')
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
    value = object.lyric;
    if (value != null) {
      result
        ..add('lyric')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Track deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrackBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'albumOfTrack':
          result.albumOfTrack.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AlbumOfTheTrack))!
              as AlbumOfTheTrack);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'artistName':
          result.artistName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'artist':
          result.artist.replace(serializers.deserialize(value,
              specifiedType: const FullType(ArtistInfo))! as ArtistInfo);
          break;
        case 'lyric':
          result.lyric = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Track extends Track {
  @override
  final String? id;
  @override
  final AlbumOfTheTrack? albumOfTrack;
  @override
  final String? name;
  @override
  final String? artistName;
  @override
  final ArtistInfo? artist;
  @override
  final String? lyric;

  factory _$Track([void Function(TrackBuilder)? updates]) =>
      (new TrackBuilder()..update(updates))._build();

  _$Track._(
      {this.id,
      this.albumOfTrack,
      this.name,
      this.artistName,
      this.artist,
      this.lyric})
      : super._();

  @override
  Track rebuild(void Function(TrackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackBuilder toBuilder() => new TrackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Track &&
        id == other.id &&
        albumOfTrack == other.albumOfTrack &&
        name == other.name &&
        artistName == other.artistName &&
        artist == other.artist &&
        lyric == other.lyric;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, albumOfTrack.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, artistName.hashCode);
    _$hash = $jc(_$hash, artist.hashCode);
    _$hash = $jc(_$hash, lyric.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Track')
          ..add('id', id)
          ..add('albumOfTrack', albumOfTrack)
          ..add('name', name)
          ..add('artistName', artistName)
          ..add('artist', artist)
          ..add('lyric', lyric))
        .toString();
  }
}

class TrackBuilder implements Builder<Track, TrackBuilder> {
  _$Track? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  AlbumOfTheTrackBuilder? _albumOfTrack;
  AlbumOfTheTrackBuilder get albumOfTrack =>
      _$this._albumOfTrack ??= new AlbumOfTheTrackBuilder();
  set albumOfTrack(AlbumOfTheTrackBuilder? albumOfTrack) =>
      _$this._albumOfTrack = albumOfTrack;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _artistName;
  String? get artistName => _$this._artistName;
  set artistName(String? artistName) => _$this._artistName = artistName;

  ArtistInfoBuilder? _artist;
  ArtistInfoBuilder get artist => _$this._artist ??= new ArtistInfoBuilder();
  set artist(ArtistInfoBuilder? artist) => _$this._artist = artist;

  String? _lyric;
  String? get lyric => _$this._lyric;
  set lyric(String? lyric) => _$this._lyric = lyric;

  TrackBuilder();

  TrackBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _albumOfTrack = $v.albumOfTrack?.toBuilder();
      _name = $v.name;
      _artistName = $v.artistName;
      _artist = $v.artist?.toBuilder();
      _lyric = $v.lyric;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Track other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Track;
  }

  @override
  void update(void Function(TrackBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Track build() => _build();

  _$Track _build() {
    _$Track _$result;
    try {
      _$result = _$v ??
          new _$Track._(
              id: id,
              albumOfTrack: _albumOfTrack?.build(),
              name: name,
              artistName: artistName,
              artist: _artist?.build(),
              lyric: lyric);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'albumOfTrack';
        _albumOfTrack?.build();

        _$failedField = 'artist';
        _artist?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Track', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
