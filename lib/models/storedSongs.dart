import 'dart:convert';

import 'package:hive/hive.dart';

part 'storedSongs.g.dart';

@HiveType(typeId: 0)
class StoredSong {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? artist;

  @HiveField(2)
  String? songTitle;

  @HiveField(3)
  String? lyrics;

  @HiveField(4)
  double? timeStamp;
  StoredSong({
    this.id,
    this.artist,
    this.songTitle,
    this.lyrics,
    this.timeStamp,
  });

  StoredSong copyWith({
    String? id,
    String? artist,
    String? songTitle,
    String? lyrics,
    double? timeStamp,
  }) {
    return StoredSong(
      id: id ?? this.id,
      artist: artist ?? this.artist,
      songTitle: songTitle ?? this.songTitle,
      lyrics: lyrics ?? this.lyrics,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'artist': artist,
      'songTitle': songTitle,
      'lyrics': lyrics,
      'timeStamp': timeStamp,
    };
  }

  factory StoredSong.fromMap(Map<String, dynamic> map) {
    return StoredSong(
      id: map['id'],
      artist: map['artist'],
      songTitle: map['songTitle'],
      lyrics: map['lyrics'],
      timeStamp: map['timeStamp']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoredSong.fromJson(String source) =>
      StoredSong.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StoredSong(id: $id, artist: $artist, songTitle: $songTitle, lyrics: $lyrics, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoredSong &&
        other.id == id &&
        other.artist == artist &&
        other.songTitle == songTitle &&
        other.lyrics == lyrics &&
        other.timeStamp == timeStamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        artist.hashCode ^
        songTitle.hashCode ^
        lyrics.hashCode ^
        timeStamp.hashCode;
  }
}
