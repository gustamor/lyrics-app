// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_images.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AlbumImages> _$albumImagesSerializer = new _$AlbumImagesSerializer();

class _$AlbumImagesSerializer implements StructuredSerializer<AlbumImages> {
  @override
  final Iterable<Type> types = const [AlbumImages, _$AlbumImages];
  @override
  final String wireName = 'AlbumImages';

  @override
  Iterable<Object?> serialize(Serializers serializers, AlbumImages object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'mbid',
      serializers.serialize(object.mbid, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Image)])),
    ];

    return result;
  }

  @override
  AlbumImages deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumImagesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'mbid':
          result.mbid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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

class _$AlbumImages extends AlbumImages {
  @override
  final String mbid;
  @override
  final BuiltList<Image> image;

  factory _$AlbumImages([void Function(AlbumImagesBuilder)? updates]) =>
      (new AlbumImagesBuilder()..update(updates))._build();

  _$AlbumImages._({required this.mbid, required this.image}) : super._() {
    BuiltValueNullFieldError.checkNotNull(mbid, r'AlbumImages', 'mbid');
    BuiltValueNullFieldError.checkNotNull(image, r'AlbumImages', 'image');
  }

  @override
  AlbumImages rebuild(void Function(AlbumImagesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumImagesBuilder toBuilder() => new AlbumImagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AlbumImages && mbid == other.mbid && image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mbid.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AlbumImages')
          ..add('mbid', mbid)
          ..add('image', image))
        .toString();
  }
}

class AlbumImagesBuilder implements Builder<AlbumImages, AlbumImagesBuilder> {
  _$AlbumImages? _$v;

  String? _mbid;
  String? get mbid => _$this._mbid;
  set mbid(String? mbid) => _$this._mbid = mbid;

  ListBuilder<Image>? _image;
  ListBuilder<Image> get image => _$this._image ??= new ListBuilder<Image>();
  set image(ListBuilder<Image>? image) => _$this._image = image;

  AlbumImagesBuilder();

  AlbumImagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mbid = $v.mbid;
      _image = $v.image.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AlbumImages other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AlbumImages;
  }

  @override
  void update(void Function(AlbumImagesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AlbumImages build() => _build();

  _$AlbumImages _build() {
    _$AlbumImages _$result;
    try {
      _$result = _$v ??
          new _$AlbumImages._(
              mbid: BuiltValueNullFieldError.checkNotNull(
                  mbid, r'AlbumImages', 'mbid'),
              image: image.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        image.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AlbumImages', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
