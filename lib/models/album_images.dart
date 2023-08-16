import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:justthelyrics/models/image.dart';
import 'package:justthelyrics/models/serializers/serializers.dart';

part 'album_images.g.dart';

abstract class AlbumImages implements Built<AlbumImages, AlbumImagesBuilder> {
  //BuiltList<Album> get album;
  String get mbid;
  BuiltList<Image> get image;

  AlbumImages._();
  factory AlbumImages([void Function(AlbumImagesBuilder) updates]) =
      _$AlbumImages;

  Object? toJson() {
    return serializers.serializeWith(AlbumImages.serializer, this);
  }

  static AlbumImages? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AlbumImages.serializer, json);
  }

  static Serializer<AlbumImages> get serializer => _$albumImagesSerializer;
}
