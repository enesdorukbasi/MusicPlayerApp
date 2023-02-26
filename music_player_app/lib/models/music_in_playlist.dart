// ignore_for_file: non_constant_identifier_names

class MusicInPlaylist {
  int id;
  int music_id;
  int playlist_id;
  String created_time;

  MusicInPlaylist(
      {required this.id,
      required this.music_id,
      required this.playlist_id,
      required this.created_time});

  factory MusicInPlaylist.fromJSON(json) {
    return MusicInPlaylist(
        id: json['id'],
        music_id: json['music_id'],
        playlist_id: json['playlist_id'],
        created_time: json['created_time']);
  }
}
