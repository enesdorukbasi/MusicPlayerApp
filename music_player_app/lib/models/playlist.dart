// ignore_for_file: non_constant_identifier_names

class Playlist {
  int id;
  String playlist_name;
  String created_time;

  Playlist({
    required this.id,
    required this.playlist_name,
    required this.created_time,
  });

  factory Playlist.fromJSON(json) {
    return Playlist(
      id: json['id'],
      playlist_name: json['playlist_name'],
      created_time: json['created_time'],
    );
  }
}
