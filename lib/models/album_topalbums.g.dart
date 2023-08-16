// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_topalbums.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TopAlbumInfo> _$topAlbumInfoSerializer =
    new _$TopAlbumInfoSerializer();

class _$TopAlbumInfoSerializer implements StructuredSerializer<TopAlbumInfo> {
  @override
  final Iterable<Type> types = const [TopAlbumInfo, _$TopAlbumInfo];
  @override
  final String wireName = 'TopAlbumInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, TopAlbumInfo object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Image)])));
    }
    return result;
  }

  @override
  TopAlbumInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TopAlbumInfoBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'artist':
          result.artist.replace(serializers.deserialize(value,
              specifiedType: const FullType(ArtistInfo))! as ArtistInfo);
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Image)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TopAlbumInfo extends TopAlbumInfo {
  @override
  final String? mbid;
  @override
  final String? name;
  @override
  final ArtistInfo? artist;
  @override
  final BuiltList<Image>? image;

  factory _$TopAlbumInfo([void Function(TopAlbumInfoBuilder)? updates]) =>
      (new TopAlbumInfoBuilder()..update(updates))._build();

  _$TopAlbumInfo._({this.mbid, this.name, this.artist, this.image}) : super._();

  @override
  TopAlbumInfo rebuild(void Function(TopAlbumInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopAlbumInfoBuilder toBuilder() => new TopAlbumInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopAlbumInfo &&
        mbid == other.mbid &&
        name == other.name &&
        artist == other.artist &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mbid.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, artist.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TopAlbumInfo')
          ..add('mbid', mbid)
          ..add('name', name)
          ..add('artist', artist)
          ..add('image', image))
        .toString();
  }
}

class TopAlbumInfoBuilder
    implements Builder<TopAlbumInfo, TopAlbumInfoBuilder> {
  _$TopAlbumInfo? _$v;

  String? _mbid;
  String? get mbid => _$this._mbid;
  set mbid(String? mbid) => _$this._mbid = mbid;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ArtistInfoBuilder? _artist;
  ArtistInfoBuilder get artist => _$this._artist ??= new ArtistInfoBuilder();
  set artist(ArtistInfoBuilder? artist) => _$this._artist = artist;

  ListBuilder<Image>? _image;
  ListBuilder<Image> get image => _$this._image ??= new ListBuilder<Image>();
  set image(ListBuilder<Image>? image) => _$this._image = image;

  TopAlbumInfoBuilder();

  TopAlbumInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mbid = $v.mbid;
      _name = $v.name;
      _artist = $v.artist?.toBuilder();
      _image = $v.image?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopAlbumInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TopAlbumInfo;
  }

  @override
  void update(void Function(TopAlbumInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopAlbumInfo build() => _build();

  _$TopAlbumInfo _build() {
    _$TopAlbumInfo _$result;
    try {
      _$result = _$v ??
          new _$TopAlbumInfo._(
              mbid: mbid,
              name: name,
              artist: _artist?.build(),
              image: _image?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'artist';
        _artist?.build();
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TopAlbumInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
