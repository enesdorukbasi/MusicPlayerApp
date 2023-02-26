// ignore_for_file: non_constant_identifier_names

class Music {
  final int id;
  final String music_name;
  final String music_path;
  final String datetime;
  final String music_id;

  const Music(
      {required this.id,
      required this.music_name,
      required this.music_path,
      required this.datetime,
      required this.music_id});

  factory Music.fromJSON(json) {
    return Music(
      id: json['id'],
      music_name: json['music_name'],
      music_path: json['music_path'],
      datetime: json['datetime'],
      music_id: json['music_id'],
    );
  }
}
