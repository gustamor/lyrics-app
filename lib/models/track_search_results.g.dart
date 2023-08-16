// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_search_results.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TrackSearchResult> _$trackSearchResultSerializer =
    new _$TrackSearchResultSerializer();

class _$TrackSearchResultSerializer
    implements StructuredSerializer<TrackSearchResult> {
  @override
  final Iterable<Type> types = const [TrackSearchResult, _$TrackSearchResult];
  @override
  final String wireName = 'TrackSearchResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, TrackSearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.track;
    if (value != null) {
      result
        ..add('track')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TrackSearch)])));
    }
    return result;
  }

  @override
  TrackSearchResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrackSearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'track':
          result.track.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TrackSearch)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TrackSearchResult extends TrackSearchResult {
  @override
  final BuiltList<TrackSearch>? track;

  factory _$TrackSearchResult(
          [void Function(TrackSearchResultBuilder)? updates]) =>
      (new TrackSearchResultBuilder()..update(updates))._build();

  _$TrackSearchResult._({this.track}) : super._();

  @override
  TrackSearchResult rebuild(void Function(TrackSearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackSearchResultBuilder toBuilder() =>
      new TrackSearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackSearchResult && track == other.track;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, track.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TrackSearchResult')
          ..add('track', track))
        .toString();
  }
}

class TrackSearchResultBuilder
    implements Builder<TrackSearchResult, TrackSearchResultBuilder> {
  _$TrackSearchResult? _$v;

  ListBuilder<TrackSearch>? _track;
  ListBuilder<TrackSearch> get track =>
      _$this._track ??= new ListBuilder<TrackSearch>();
  set track(ListBuilder<TrackSearch>? track) => _$this._track = track;

  TrackSearchResultBuilder();

  TrackSearchResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _track = $v.track?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TrackSearchResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TrackSearchResult;
  }

  @override
  void update(void Function(TrackSearchResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TrackSearchResult build() => _build();

  _$TrackSearchResult _build() {
    _$TrackSearchResult _$result;
    try {
      _$result = _$v ?? new _$TrackSearchResult._(track: _track?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'track';
        _track?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TrackSearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
