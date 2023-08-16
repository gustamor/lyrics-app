// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_similar.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArtistSimilar> _$artistSimilarSerializer =
    new _$ArtistSimilarSerializer();

class _$ArtistSimilarSerializer implements StructuredSerializer<ArtistSimilar> {
  @override
  final Iterable<Type> types = const [ArtistSimilar, _$ArtistSimilar];
  @override
  final String wireName = 'ArtistSimilar';

  @override
  Iterable<Object?> serialize(Serializers serializers, ArtistSimilar object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.artist;
    if (value != null) {
      result
        ..add('artist')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(ArtistInfo)])));
    }
    return result;
  }

  @override
  ArtistSimilar deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtistSimilarBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'artist':
          result.artist.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ArtistInfo)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ArtistSimilar extends ArtistSimilar {
  @override
  final BuiltList<ArtistInfo>? artist;

  factory _$ArtistSimilar([void Function(ArtistSimilarBuilder)? updates]) =>
      (new ArtistSimilarBuilder()..update(updates))._build();

  _$ArtistSimilar._({this.artist}) : super._();

  @override
  ArtistSimilar rebuild(void Function(ArtistSimilarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtistSimilarBuilder toBuilder() => new ArtistSimilarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtistSimilar && artist == other.artist;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, artist.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArtistSimilar')
          ..add('artist', artist))
        .toString();
  }
}

class ArtistSimilarBuilder
    implements Builder<ArtistSimilar, ArtistSimilarBuilder> {
  _$ArtistSimilar? _$v;

  ListBuilder<ArtistInfo>? _artist;
  ListBuilder<ArtistInfo> get artist =>
      _$this._artist ??= new ListBuilder<ArtistInfo>();
  set artist(ListBuilder<ArtistInfo>? artist) => _$this._artist = artist;

  ArtistSimilarBuilder();

  ArtistSimilarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _artist = $v.artist?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArtistSimilar other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArtistSimilar;
  }

  @override
  void update(void Function(ArtistSimilarBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArtistSimilar build() => _build();

  _$ArtistSimilar _build() {
    _$ArtistSimilar _$result;
    try {
      _$result = _$v ?? new _$ArtistSimilar._(artist: _artist?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'artist';
        _artist?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ArtistSimilar', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
