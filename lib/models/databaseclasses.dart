import 'dart:convert';

class TrackDos {
  final String? mbid;

  final String? artist;

  final String? title;

  final String? albumId;
  final String? albumMbid;
  final String? lyric;
  TrackDos({
    this.mbid,
    this.artist,
    this.title,
    this.albumId,
    this.albumMbid,
    this.lyric,
  });

  TrackDos copyWith({
    String? mbid,
    String? artist,
    String? title,
    String? albumId,
    String? albumMbid,
    String? lyric,
  }) {
    return TrackDos(
      mbid: mbid ?? this.mbid,
      artist: artist ?? this.artist,
      title: title ?? this.title,
      albumId: albumId ?? this.albumId,
      albumMbid: albumMbid ?? this.albumMbid,
      lyric: lyric ?? this.lyric,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mbid': mbid,
      'artist': artist,
      'title': title,
      'albumId': albumId,
      'albumMbid': albumMbid,
      'lyric': lyric,
    };
  }

  factory TrackDos.fromMap(Map<String, dynamic> map) {
    return TrackDos(
      mbid: map['mbid'],
      artist: map['artist'],
      title: map['title'],
      albumId: map['albumId'],
      albumMbid: map['albumMbid'],
      lyric: map['lyric'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackDos.fromJson(String source) =>
      TrackDos.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TrackDos(mbid: $mbid, artist: $artist, title: $title, albumId: $albumId, albumMbid: $albumMbid, lyric: $lyric)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrackDos &&
        other.mbid == mbid &&
        other.artist == artist &&
        other.title == title &&
        other.albumId == albumId &&
        other.albumMbid == albumMbid &&
        other.lyric == lyric;
  }

  @override
  int get hashCode {
    return mbid.hashCode ^
        artist.hashCode ^
        title.hashCode ^
        albumId.hashCode ^
        albumMbid.hashCode ^
        lyric.hashCode;
  }
}

/* 
class ArtistDos {
  String? mbid;
  String? name;
  ArtistDos({
    this.mbid,
    this.name,
  });

  ArtistDos copyWith({
    String? mbid,
    String? name,
  }) {
    return ArtistDos(
      mbid: mbid ?? this.mbid,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mbid': mbid,
      'name': name,
    };
  }

  factory ArtistDos.fromMap(Map<String, dynamic> map) {
    return ArtistDos(
      mbid: map['mbid'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistDos.fromJson(String source) =>
      ArtistDos.fromMap(json.decode(source));

  @override
  String toString() => 'ArtistDos(mbid: $mbid, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArtistDos && other.mbid == mbid && other.name == name;
  }

  @override
  int get hashCode => mbid.hashCode ^ name.hashCode;
}

class Album {
  String? mbid;
  String? title;
  String? artistMbid;
  String id;
  Album({
    this.mbid,
    this.title,
    this.artistMbid,
    required this.id,
  });

  Album copyWith({
    String? mbid,
    String? title,
    String? artistMbid,
    String? id,
  }) {
    return Album(
      mbid: mbid ?? this.mbid,
      title: title ?? this.title,
      artistMbid: artistMbid ?? this.artistMbid,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mbid': mbid,
      'title': title,
      'artistMbid': artistMbid,
      'id': id,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      mbid: map['mbid'],
      title: map['title'],
      artistMbid: map['artistMbid'],
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Album.fromJson(String source) => Album.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Album(mbid: $mbid, title: $title, artistMbid: $artistMbid, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Album &&
        other.mbid == mbid &&
        other.title == title &&
        other.artistMbid == artistMbid &&
        other.id == id;
  }

  @override
  int get hashCode {
    return mbid.hashCode ^ title.hashCode ^ artistMbid.hashCode ^ id.hashCode;
  }
}

class TrackSearched {
  String? id;
  String? artist;
  String? title;
  TrackSearched({
    this.id,
    this.artist,
    this.title,
  });

  TrackSearched copyWith({
    String? id,
    String? artist,
    String? title,
  }) {
    return TrackSearched(
      id: id ?? this.id,
      artist: artist ?? this.artist,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'artist': artist,
      'title': title,
    };
  }

  factory TrackSearched.fromMap(Map<String, dynamic> map) {
    return TrackSearched(
      id: map['id'],
      artist: map['artist'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackSearched.fromJson(String source) =>
      TrackSearched.fromMap(json.decode(source));

  @override
  String toString() => 'TrackSearched(id: $id, artist: $artist, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrackSearched &&
        other.id == id &&
        other.artist == artist &&
        other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ artist.hashCode ^ title.hashCode;
}

class AlbumWikiInfo {
  String? published;
  String? summary;
  String? content;
  String? albumMbid;
  AlbumWikiInfo({
    required this.published,
    required this.summary,
    required this.content,
    required this.albumMbid,
  });

  AlbumWikiInfo copyWith({
    String? published,
    String? summary,
    String? content,
    String? albumMbid,
  }) {
    return AlbumWikiInfo(
      published: published ?? this.published,
      summary: summary ?? this.summary,
      content: content ?? this.content,
      albumMbid: albumMbid ?? this.albumMbid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'published': published,
      'summary': summary,
      'content': content,
      'albumMbid': albumMbid,
    };
  }

  factory AlbumWikiInfo.fromMap(Map<String, dynamic> map) {
    return AlbumWikiInfo(
      published: map['published'],
      summary: map['summary'],
      content: map['content'],
      albumMbid: map['albumMbid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumWikiInfo.fromJson(String source) =>
      AlbumWikiInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AlbumInfo(published: $published, summary: $summary, content: $content, albumMbid: $albumMbid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlbumWikiInfo &&
        other.published == published &&
        other.summary == summary &&
        other.content == content &&
        other.albumMbid == albumMbid;
  }

  @override
  int get hashCode {
    return published.hashCode ^
        summary.hashCode ^
        content.hashCode ^
        albumMbid.hashCode;
  }
}

class ImageDos {
  String? id;
  String? url;
  String? size;
  String? albumMbid;
  String? albumId;
  ImageDos({
    this.id,
    this.url,
    this.size,
    this.albumMbid,
    this.albumId,
  });

  ImageDos copyWith({
    String? id,
    String? url,
    String? size,
    String? albumMbid,
    String? albumId,
  }) {
    return ImageDos(
      id: id ?? this.id,
      url: url ?? this.url,
      size: size ?? this.size,
      albumMbid: albumMbid ?? this.albumMbid,
      albumId: albumId ?? this.albumId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'size': size,
      'albumMbid': albumMbid,
      'albumId': albumId,
    };
  }

  factory ImageDos.fromMap(Map<String, dynamic> map) {
    return ImageDos(
      id: map['id'],
      url: map['url'],
      size: map['size'],
      albumMbid: map['albumMbid'],
      albumId: map['albumId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageDos.fromJson(String source) =>
      ImageDos.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ImageDos(id: $id, url: $url, size: $size, albumMbid: $albumMbid, albumId: $albumId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageDos &&
        other.id == id &&
        other.url == url &&
        other.size == size &&
        other.albumMbid == albumMbid &&
        other.albumId == albumId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        url.hashCode ^
        size.hashCode ^
        albumMbid.hashCode ^
        albumId.hashCode;
  }
}

class Favorite {
  String id;
  String trackMbid;
  Favorite({
    required this.id,
    required this.trackMbid,
  });

  Favorite copyWith({
    String? id,
    String? trackMbid,
  }) {
    return Favorite(
      id: id ?? this.id,
      trackMbid: trackMbid ?? this.trackMbid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'trackMbid': trackMbid,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'] ?? '',
      trackMbid: map['trackMbid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source));

  @override
  String toString() => 'Favorite(id: $id, trackMbid: $trackMbid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Favorite && other.id == id && other.trackMbid == trackMbid;
  }

  @override
  int get hashCode => id.hashCode ^ trackMbid.hashCode;
}

class BlackList {
  String trackID;
  BlackList({
    required this.trackID,
  });

  BlackList copyWith({
    String? trackID,
  }) {
    return BlackList(
      trackID: trackID ?? this.trackID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'trackID': trackID,
    };
  }

  factory BlackList.fromMap(Map<String, dynamic> map) {
    return BlackList(
      trackID: map['trackID'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BlackList.fromJson(String source) =>
      BlackList.fromMap(json.decode(source));

  @override
  String toString() => 'BlackList(trackID: $trackID)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BlackList && other.trackID == trackID;
  }

  @override
  int get hashCode => trackID.hashCode;
}
 */