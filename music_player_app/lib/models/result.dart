import 'dart:convert';

MusicDownloadInfoResult musicDownloadInfoResultFromJson(String str) =>
    MusicDownloadInfoResult.fromJson(json.decode(str));

String musicDownloadInfoResultToJson(MusicDownloadInfoResult data) =>
    json.encode(data.toJson());

class MusicDownloadInfoResult {
  MusicDownloadInfoResult({
    required this.creator,
    required this.pilihanType,
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.mp4,
    required this.audio,
  });

  String creator;
  String pilihanType;
  String id;
  String thumbnail;
  String title;
  Mp4 mp4;
  Audio audio;

  factory MusicDownloadInfoResult.fromJson(Map<String, dynamic> json) =>
      MusicDownloadInfoResult(
        creator: json["creator"],
        pilihanType: json["pilihan_type"],
        id: json["id"],
        thumbnail: json["thumbnail"],
        title: json["title"],
        mp4: Mp4.fromJson(json["mp4"]),
        audio: Audio.fromJson(json["audio"]),
      );

  Map<String, dynamic> toJson() => {
        "creator": creator,
        "pilihan_type": pilihanType,
        "id": id,
        "thumbnail": thumbnail,
        "title": title,
        "mp4": mp4.toJson(),
        "audio": audio.toJson(),
      };
}

class Audio {
  Audio({
    required this.audio,
    required this.size,
  });

  String audio;
  String size;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        audio: json["audio"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "audio": audio,
        "size": size,
      };
}

class Mp4 {
  Mp4({
    required this.download,
    required this.size,
    required this.typeDownload,
  });

  String download;
  String size;
  String typeDownload;

  factory Mp4.fromJson(Map<String, dynamic> json) => Mp4(
        download: json["download"],
        size: json["size"],
        typeDownload: json["type_download"],
      );

  Map<String, dynamic> toJson() => {
        "download": download,
        "size": size,
        "type_download": typeDownload,
      };
}
