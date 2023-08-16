// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_of_a_track.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AlbumOfTheTrack> _$albumOfTheTrackSerializer =
    new _$AlbumOfTheTrackSerializer();

class _$AlbumOfTheTrackSerializer
    implements StructuredSerializer<AlbumOfTheTrack> {
  @override
  final Iterable<Type> types = const [AlbumOfTheTrack, _$AlbumOfTheTrack];
  @override
  final String wireName = 'AlbumOfTheTrack';

  @override
  Iterable<Object?> serialize(Serializers serializers, AlbumOfTheTrack object,
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
    value = object.albumId;
    if (value != null) {
      result
        ..add('albumId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
    return result;
  }

  @override
  AlbumOfTheTrack deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumOfTheTrackBuilder();

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
        case 'albumId':
          result.albumId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'artist':
          result.artist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$AlbumOfTheTrack extends AlbumOfTheTrack {
  @override
  final String? mbid;
  @override
  final String? albumId;
  @override
  final String? title;
  @override
  final String? artist;

  factory _$AlbumOfTheTrack([void Function(AlbumOfTheTrackBuilder)? updates]) =>
      (new AlbumOfTheTrackBuilder()..update(updates))._build();

  _$AlbumOfTheTrack._({this.mbid, this.albumId, this.title, this.artist})
      : super._();

  @override
  AlbumOfTheTrack rebuild(void Function(AlbumOfTheTrackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumOfTheTrackBuilder toBuilder() =>
      new AlbumOfTheTrackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AlbumOfTheTrack &&
        mbid == other.mbid &&
        albumId == other.albumId &&
        title == other.title &&
        artist == other.artist;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mbid.hashCode);
    _$hash = $jc(_$hash, albumId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, artist.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AlbumOfTheTrack')
          ..add('mbid', mbid)
          ..add('albumId', albumId)
          ..add('title', title)
          ..add('artist', artist))
        .toString();
  }
}

class AlbumOfTheTrackBuilder
    implements Builder<AlbumOfTheTrack, AlbumOfTheTrackBuilder> {
  _$AlbumOfTheTrack? _$v;

  String? _mbid;
  String? get mbid => _$this._mbid;
  set mbid(String? mbid) => _$this._mbid = mbid;

  String? _albumId;
  String? get albumId => _$this._albumId;
  set albumId(String? albumId) => _$this._albumId = albumId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _artist;
  String? get artist => _$this._artist;
  set artist(String? artist) => _$this._artist = artist;

  AlbumOfTheTrackBuilder();

  AlbumOfTheTrackBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mbid = $v.mbid;
      _albumId = $v.albumId;
      _title = $v.title;
      _artist = $v.artist;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AlbumOfTheTrack other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AlbumOfTheTrack;
  }

  @override
  void update(void Function(AlbumOfTheTrackBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AlbumOfTheTrack build() => _build();

  _$AlbumOfTheTrack _build() {
    final _$result = _$v ??
        new _$AlbumOfTheTrack._(
            mbid: mbid, albumId: albumId, title: title, artist: artist);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
