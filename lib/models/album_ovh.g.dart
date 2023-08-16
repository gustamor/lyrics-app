// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_ovh.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AlbumOvhInfo> _$albumOvhInfoSerializer =
    new _$AlbumOvhInfoSerializer();

class _$AlbumOvhInfoSerializer implements StructuredSerializer<AlbumOvhInfo> {
  @override
  final Iterable<Type> types = const [AlbumOvhInfo, _$AlbumOvhInfo];
  @override
  final String wireName = 'AlbumOvhInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, AlbumOvhInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'cover',
      serializers.serialize(object.cover,
          specifiedType: const FullType(String)),
      'cover_small',
      serializers.serialize(object.cover_small,
          specifiedType: const FullType(String)),
      'cover_medium',
      serializers.serialize(object.cover_medium,
          specifiedType: const FullType(String)),
      'cover_big',
      serializers.serialize(object.cover_big,
          specifiedType: const FullType(String)),
      'cover_xl',
      serializers.serialize(object.cover_xl,
          specifiedType: const FullType(String)),
      'tracklist',
      serializers.serialize(object.tracklist,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AlbumOvhInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumOvhInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cover':
          result.cover = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cover_small':
          result.cover_small = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cover_medium':
          result.cover_medium = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cover_big':
          result.cover_big = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cover_xl':
          result.cover_xl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'tracklist':
          result.tracklist = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AlbumOvhInfo extends AlbumOvhInfo {
  @override
  final int id;
  @override
  final String title;
  @override
  final String cover;
  @override
  final String cover_small;
  @override
  final String cover_medium;
  @override
  final String cover_big;
  @override
  final String cover_xl;
  @override
  final String tracklist;

  factory _$AlbumOvhInfo([void Function(AlbumOvhInfoBuilder)? updates]) =>
      (new AlbumOvhInfoBuilder()..update(updates))._build();

  _$AlbumOvhInfo._(
      {required this.id,
      required this.title,
      required this.cover,
      required this.cover_small,
      required this.cover_medium,
      required this.cover_big,
      required this.cover_xl,
      required this.tracklist})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AlbumOvhInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'AlbumOvhInfo', 'title');
    BuiltValueNullFieldError.checkNotNull(cover, r'AlbumOvhInfo', 'cover');
    BuiltValueNullFieldError.checkNotNull(
        cover_small, r'AlbumOvhInfo', 'cover_small');
    BuiltValueNullFieldError.checkNotNull(
        cover_medium, r'AlbumOvhInfo', 'cover_medium');
    BuiltValueNullFieldError.checkNotNull(
        cover_big, r'AlbumOvhInfo', 'cover_big');
    BuiltValueNullFieldError.checkNotNull(
        cover_xl, r'AlbumOvhInfo', 'cover_xl');
    BuiltValueNullFieldError.checkNotNull(
        tracklist, r'AlbumOvhInfo', 'tracklist');
  }

  @override
  AlbumOvhInfo rebuild(void Function(AlbumOvhInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumOvhInfoBuilder toBuilder() => new AlbumOvhInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AlbumOvhInfo &&
        id == other.id &&
        title == other.title &&
        cover == other.cover &&
        cover_small == other.cover_small &&
        cover_medium == other.cover_medium &&
        cover_big == other.cover_big &&
        cover_xl == other.cover_xl &&
        tracklist == other.tracklist;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, cover.hashCode);
    _$hash = $jc(_$hash, cover_small.hashCode);
    _$hash = $jc(_$hash, cover_medium.hashCode);
    _$hash = $jc(_$hash, cover_big.hashCode);
    _$hash = $jc(_$hash, cover_xl.hashCode);
    _$hash = $jc(_$hash, tracklist.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AlbumOvhInfo')
          ..add('id', id)
          ..add('title', title)
          ..add('cover', cover)
          ..add('cover_small', cover_small)
          ..add('cover_medium', cover_medium)
          ..add('cover_big', cover_big)
          ..add('cover_xl', cover_xl)
          ..add('tracklist', tracklist))
        .toString();
  }
}

class AlbumOvhInfoBuilder
    implements Builder<AlbumOvhInfo, AlbumOvhInfoBuilder> {
  _$AlbumOvhInfo? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _cover;
  String? get cover => _$this._cover;
  set cover(String? cover) => _$this._cover = cover;

  String? _cover_small;
  String? get cover_small => _$this._cover_small;
  set cover_small(String? cover_small) => _$this._cover_small = cover_small;

  String? _cover_medium;
  String? get cover_medium => _$this._cover_medium;
  set cover_medium(String? cover_medium) => _$this._cover_medium = cover_medium;

  String? _cover_big;
  String? get cover_big => _$this._cover_big;
  set cover_big(String? cover_big) => _$this._cover_big = cover_big;

  String? _cover_xl;
  String? get cover_xl => _$this._cover_xl;
  set cover_xl(String? cover_xl) => _$this._cover_xl = cover_xl;

  String? _tracklist;
  String? get tracklist => _$this._tracklist;
  set tracklist(String? tracklist) => _$this._tracklist = tracklist;

  AlbumOvhInfoBuilder();

  AlbumOvhInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _cover = $v.cover;
      _cover_small = $v.cover_small;
      _cover_medium = $v.cover_medium;
      _cover_big = $v.cover_big;
      _cover_xl = $v.cover_xl;
      _tracklist = $v.tracklist;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AlbumOvhInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AlbumOvhInfo;
  }

  @override
  void update(void Function(AlbumOvhInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AlbumOvhInfo build() => _build();

  _$AlbumOvhInfo _build() {
    final _$result = _$v ??
        new _$AlbumOvhInfo._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AlbumOvhInfo', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AlbumOvhInfo', 'title'),
            cover: BuiltValueNullFieldError.checkNotNull(
                cover, r'AlbumOvhInfo', 'cover'),
            cover_small: BuiltValueNullFieldError.checkNotNull(
                cover_small, r'AlbumOvhInfo', 'cover_small'),
            cover_medium: BuiltValueNullFieldError.checkNotNull(
                cover_medium, r'AlbumOvhInfo', 'cover_medium'),
            cover_big: BuiltValueNullFieldError.checkNotNull(
                cover_big, r'AlbumOvhInfo', 'cover_big'),
            cover_xl: BuiltValueNullFieldError.checkNotNull(
                cover_xl, r'AlbumOvhInfo', 'cover_xl'),
            tracklist: BuiltValueNullFieldError.checkNotNull(
                tracklist, r'AlbumOvhInfo', 'tracklist'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
