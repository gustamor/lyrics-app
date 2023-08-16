import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';

part 'image.g.dart';

abstract class Image implements Built<Image, ImageBuilder> {
  @BuiltValueField(wireName: r'#text')
  String get url;
  String get size;

  Image._();
  factory Image([void Function(ImageBuilder) updates]) = _$Image;

  Object? toJson() {
    return serializers.serializeWith(Image.serializer, this);
  }

  static Image? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Image.serializer, json);
  }

  static Serializer<Image> get serializer => _$imageSerializer;
}
