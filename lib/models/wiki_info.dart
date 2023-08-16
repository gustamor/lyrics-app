import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';

part 'wiki_info.g.dart';

abstract class WikiInfo implements Built<WikiInfo, WikiInfoBuilder> {
  String? get published;
  String? get summary;
  String? get content;

  WikiInfo._();

  factory WikiInfo([void Function(WikiInfoBuilder) updates]) = _$WikiInfo;

  Object? toJson() {
    return serializers.serializeWith(WikiInfo.serializer, this);
  }

  static WikiInfo? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WikiInfo.serializer, json);
  }

  static Serializer<WikiInfo> get serializer => _$wikiInfoSerializer;
}
