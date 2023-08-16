// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_topalbums.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TopAlbums> _$topAlbumsSerializer = new _$TopAlbumsSerializer();

class _$TopAlbumsSerializer implements StructuredSerializer<TopAlbums> {
  @override
  final Iterable<Type> types = const [TopAlbums, _$TopAlbums];
  @override
  final String wireName = 'TopAlbums';

  @override
  Iterable<Object?> serialize(Serializers serializers, TopAlbums object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.album;
    if (value != null) {
      result
        ..add('album')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TopAlbumInfo)])));
    }
    return result;
  }

  @override
  TopAlbums deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TopAlbumsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'album':
          result.album.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TopAlbumInfo)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TopAlbums extends TopAlbums {
  @override
  final BuiltList<TopAlbumInfo>? album;

  factory _$TopAlbums([void Function(TopAlbumsBuilder)? updates]) =>
      (new TopAlbumsBuilder()..update(updates))._build();

  _$TopAlbums._({this.album}) : super._();

  @override
  TopAlbums rebuild(void Function(TopAlbumsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopAlbumsBuilder toBuilder() => new TopAlbumsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopAlbums && album == other.album;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, album.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TopAlbums')..add('album', album))
        .toString();
  }
}

class TopAlbumsBuilder implements Builder<TopAlbums, TopAlbumsBuilder> {
  _$TopAlbums? _$v;

  ListBuilder<TopAlbumInfo>? _album;
  ListBuilder<TopAlbumInfo> get album =>
      _$this._album ??= new ListBuilder<TopAlbumInfo>();
  set album(ListBuilder<TopAlbumInfo>? album) => _$this._album = album;

  TopAlbumsBuilder();

  TopAlbumsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _album = $v.album?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopAlbums other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TopAlbums;
  }

  @override
  void update(void Function(TopAlbumsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopAlbums build() => _build();

  _$TopAlbums _build() {
    _$TopAlbums _$result;
    try {
      _$result = _$v ?? new _$TopAlbums._(album: _album?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'album';
        _album?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TopAlbums', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
