// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storedSongs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoredSongAdapter extends TypeAdapter<StoredSong> {
  @override
  final int typeId = 0;

  @override
  StoredSong read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoredSong(
      id: fields[0] as String?,
      artist: fields[1] as String?,
      songTitle: fields[2] as String?,
      lyrics: fields[3] as String?,
      timeStamp: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, StoredSong obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.artist)
      ..writeByte(2)
      ..write(obj.songTitle)
      ..writeByte(3)
      ..write(obj.lyrics)
      ..writeByte(4)
      ..write(obj.timeStamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoredSongAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
