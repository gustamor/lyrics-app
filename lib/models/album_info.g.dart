// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AlbumTracks> _$albumTracksSerializer = new _$AlbumTracksSerializer();

class _$AlbumTracksSerializer implements StructuredSerializer<AlbumTracks> {
  @override
  final Iterable<Type> types = const [AlbumTracks, _$AlbumTracks];
  @override
  final String wireName = 'AlbumTracks';

  @override
  Iterable<Object?> serialize(Serializers serializers, AlbumTracks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'track',
      serializers.serialize(object.track,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Track)])),
      'wiki',
      serializers.serialize(object.wiki,
          specifiedType: const FullType(WikiInfo)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Image)])),
    ];

    return result;
  }

  @override
  AlbumTracks deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumTracksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'track':
          result.track.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Track)]))!
              as BuiltList<Object?>);
          break;
        case 'wiki':
          result.wiki.replace(serializers.deserialize(value,
              specifiedType: const FullType(WikiInfo))! as WikiInfo);
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Image)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AlbumTracks extends AlbumTracks {
  @override
  final BuiltList<Track> track;
  @override
  final WikiInfo wiki;
  @override
  final BuiltList<Image> images;

  factory _$AlbumTracks([void Function(AlbumTracksBuilder)? updates]) =>
      (new AlbumTracksBuilder()..update(updates))._build();

  _$AlbumTracks._(
      {required this.track, required this.wiki, required this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(track, r'AlbumTracks', 'track');
    BuiltValueNullFieldError.checkNotNull(wiki, r'AlbumTracks', 'wiki');
    BuiltValueNullFieldError.checkNotNull(images, r'AlbumTracks', 'images');
  }

  @override
  AlbumTracks rebuild(void Function(AlbumTracksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumTracksBuilder toBuilder() => new AlbumTracksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AlbumTracks &&
        track == other.track &&
        wiki == other.wiki &&
        images == other.images;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, track.hashCode);
    _$hash = $jc(_$hash, wiki.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AlbumTracks')
          ..add('track', track)
          ..add('wiki', wiki)
          ..add('images', images))
        .toString();
  }
}

class AlbumTracksBuilder implements Builder<AlbumTracks, AlbumTracksBuilder> {
  _$AlbumTracks? _$v;

  ListBuilder<Track>? _track;
  ListBuilder<Track> get track => _$this._track ??= new ListBuilder<Track>();
  set track(ListBuilder<Track>? track) => _$this._track = track;

  WikiInfoBuilder? _wiki;
  WikiInfoBuilder get wiki => _$this._wiki ??= new WikiInfoBuilder();
  set wiki(WikiInfoBuilder? wiki) => _$this._wiki = wiki;

  ListBuilder<Image>? _images;
  ListBuilder<Image> get images => _$this._images ??= new ListBuilder<Image>();
  set images(ListBuilder<Image>? images) => _$this._images = images;

  AlbumTracksBuilder();

  AlbumTracksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _track = $v.track.toBuilder();
      _wiki = $v.wiki.toBuilder();
      _images = $v.images.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AlbumTracks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AlbumTracks;
  }

  @override
  void update(void Function(AlbumTracksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AlbumTracks build() => _build();

  _$AlbumTracks _build() {
    _$AlbumTracks _$result;
    try {
      _$result = _$v ??
          new _$AlbumTracks._(
              track: track.build(), wiki: wiki.build(), images: images.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'track';
        track.build();
        _$failedField = 'wiki';
        wiki.build();
        _$failedField = 'images';
        images.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AlbumTracks', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
