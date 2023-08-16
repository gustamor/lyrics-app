// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_ovh_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TrackOvhSearchResult> _$trackOvhSearchResultSerializer =
    new _$TrackOvhSearchResultSerializer();

class _$TrackOvhSearchResultSerializer
    implements StructuredSerializer<TrackOvhSearchResult> {
  @override
  final Iterable<Type> types = const [
    TrackOvhSearchResult,
    _$TrackOvhSearchResult
  ];
  @override
  final String wireName = 'TrackOvhSearchResult';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TrackOvhSearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TrackOvhSearch)])));
    }
    return result;
  }

  @override
  TrackOvhSearchResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrackOvhSearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TrackOvhSearch)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TrackOvhSearchResult extends TrackOvhSearchResult {
  @override
  final BuiltList<TrackOvhSearch>? data;

  factory _$TrackOvhSearchResult(
          [void Function(TrackOvhSearchResultBuilder)? updates]) =>
      (new TrackOvhSearchResultBuilder()..update(updates))._build();

  _$TrackOvhSearchResult._({this.data}) : super._();

  @override
  TrackOvhSearchResult rebuild(
          void Function(TrackOvhSearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackOvhSearchResultBuilder toBuilder() =>
      new TrackOvhSearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackOvhSearchResult && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TrackOvhSearchResult')
          ..add('data', data))
        .toString();
  }
}

class TrackOvhSearchResultBuilder
    implements Builder<TrackOvhSearchResult, TrackOvhSearchResultBuilder> {
  _$TrackOvhSearchResult? _$v;

  ListBuilder<TrackOvhSearch>? _data;
  ListBuilder<TrackOvhSearch> get data =>
      _$this._data ??= new ListBuilder<TrackOvhSearch>();
  set data(ListBuilder<TrackOvhSearch>? data) => _$this._data = data;

  TrackOvhSearchResultBuilder();

  TrackOvhSearchResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TrackOvhSearchResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TrackOvhSearchResult;
  }

  @override
  void update(void Function(TrackOvhSearchResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TrackOvhSearchResult build() => _build();

  _$TrackOvhSearchResult _build() {
    _$TrackOvhSearchResult _$result;
    try {
      _$result = _$v ?? new _$TrackOvhSearchResult._(data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TrackOvhSearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
