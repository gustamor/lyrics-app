// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wiki_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WikiInfo> _$wikiInfoSerializer = new _$WikiInfoSerializer();

class _$WikiInfoSerializer implements StructuredSerializer<WikiInfo> {
  @override
  final Iterable<Type> types = const [WikiInfo, _$WikiInfo];
  @override
  final String wireName = 'WikiInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, WikiInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.published;
    if (value != null) {
      result
        ..add('published')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.summary;
    if (value != null) {
      result
        ..add('summary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  WikiInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WikiInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'published':
          result.published = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'summary':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$WikiInfo extends WikiInfo {
  @override
  final String? published;
  @override
  final String? summary;
  @override
  final String? content;

  factory _$WikiInfo([void Function(WikiInfoBuilder)? updates]) =>
      (new WikiInfoBuilder()..update(updates))._build();

  _$WikiInfo._({this.published, this.summary, this.content}) : super._();

  @override
  WikiInfo rebuild(void Function(WikiInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WikiInfoBuilder toBuilder() => new WikiInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WikiInfo &&
        published == other.published &&
        summary == other.summary &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, published.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WikiInfo')
          ..add('published', published)
          ..add('summary', summary)
          ..add('content', content))
        .toString();
  }
}

class WikiInfoBuilder implements Builder<WikiInfo, WikiInfoBuilder> {
  _$WikiInfo? _$v;

  String? _published;
  String? get published => _$this._published;
  set published(String? published) => _$this._published = published;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  WikiInfoBuilder();

  WikiInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _published = $v.published;
      _summary = $v.summary;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WikiInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WikiInfo;
  }

  @override
  void update(void Function(WikiInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WikiInfo build() => _build();

  _$WikiInfo _build() {
    final _$result = _$v ??
        new _$WikiInfo._(
            published: published, summary: summary, content: content);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
