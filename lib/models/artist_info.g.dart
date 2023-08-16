// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArtistInfo> _$artistInfoSerializer = new _$ArtistInfoSerializer();

class _$ArtistInfoSerializer implements StructuredSerializer<ArtistInfo> {
  @override
  final Iterable<Type> types = const [ArtistInfo, _$ArtistInfo];
  @override
  final String wireName = 'ArtistInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, ArtistInfo object,
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
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.picture;
    if (value != null) {
      result
        ..add('picture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.picture_small;
    if (value != null) {
      result
        ..add('picture_small')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.picture_medium;
    if (value != null) {
      result
        ..add('picture_medium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.picture_big;
    if (value != null) {
      result
        ..add('picture_big')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.picture_xl;
    if (value != null) {
      result
        ..add('picture_xl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tracklist;
    if (value != null) {
      result
        ..add('tracklist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ArtistInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtistInfoBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picture':
          result.picture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picture_small':
          result.picture_small = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picture_medium':
          result.picture_medium = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picture_big':
          result.picture_big = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picture_xl':
          result.picture_xl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tracklist':
          result.tracklist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ArtistInfo extends ArtistInfo {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? picture;
  @override
  final String? picture_small;
  @override
  final String? picture_medium;
  @override
  final String? picture_big;
  @override
  final String? picture_xl;
  @override
  final String? tracklist;

  factory _$ArtistInfo([void Function(ArtistInfoBuilder)? updates]) =>
      (new ArtistInfoBuilder()..update(updates))._build();

  _$ArtistInfo._(
      {this.id,
      this.name,
      this.picture,
      this.picture_small,
      this.picture_medium,
      this.picture_big,
      this.picture_xl,
      this.tracklist})
      : super._();

  @override
  ArtistInfo rebuild(void Function(ArtistInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtistInfoBuilder toBuilder() => new ArtistInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtistInfo &&
        id == other.id &&
        name == other.name &&
        picture == other.picture &&
        picture_small == other.picture_small &&
        picture_medium == other.picture_medium &&
        picture_big == other.picture_big &&
        picture_xl == other.picture_xl &&
        tracklist == other.tracklist;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, picture.hashCode);
    _$hash = $jc(_$hash, picture_small.hashCode);
    _$hash = $jc(_$hash, picture_medium.hashCode);
    _$hash = $jc(_$hash, picture_big.hashCode);
    _$hash = $jc(_$hash, picture_xl.hashCode);
    _$hash = $jc(_$hash, tracklist.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArtistInfo')
          ..add('id', id)
          ..add('name', name)
          ..add('picture', picture)
          ..add('picture_small', picture_small)
          ..add('picture_medium', picture_medium)
          ..add('picture_big', picture_big)
          ..add('picture_xl', picture_xl)
          ..add('tracklist', tracklist))
        .toString();
  }
}

class ArtistInfoBuilder implements Builder<ArtistInfo, ArtistInfoBuilder> {
  _$ArtistInfo? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _picture;
  String? get picture => _$this._picture;
  set picture(String? picture) => _$this._picture = picture;

  String? _picture_small;
  String? get picture_small => _$this._picture_small;
  set picture_small(String? picture_small) =>
      _$this._picture_small = picture_small;

  String? _picture_medium;
  String? get picture_medium => _$this._picture_medium;
  set picture_medium(String? picture_medium) =>
      _$this._picture_medium = picture_medium;

  String? _picture_big;
  String? get picture_big => _$this._picture_big;
  set picture_big(String? picture_big) => _$this._picture_big = picture_big;

  String? _picture_xl;
  String? get picture_xl => _$this._picture_xl;
  set picture_xl(String? picture_xl) => _$this._picture_xl = picture_xl;

  String? _tracklist;
  String? get tracklist => _$this._tracklist;
  set tracklist(String? tracklist) => _$this._tracklist = tracklist;

  ArtistInfoBuilder();

  ArtistInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _picture = $v.picture;
      _picture_small = $v.picture_small;
      _picture_medium = $v.picture_medium;
      _picture_big = $v.picture_big;
      _picture_xl = $v.picture_xl;
      _tracklist = $v.tracklist;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArtistInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArtistInfo;
  }

  @override
  void update(void Function(ArtistInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArtistInfo build() => _build();

  _$ArtistInfo _build() {
    final _$result = _$v ??
        new _$ArtistInfo._(
            id: id,
            name: name,
            picture: picture,
            picture_small: picture_small,
            picture_medium: picture_medium,
            picture_big: picture_big,
            picture_xl: picture_xl,
            tracklist: tracklist);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
