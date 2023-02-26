// ignore_for_file: non_constant_identifier_names

import 'package:music_player_app/models/playlist.dart';

import 'local_db_service.dart';

class LocalDbPlaylistService extends LocalDbService {
  Future<void> addPlaylist({
    required String playlist_name,
  }) async {
    var db = await database;
    await db.insert('playlist', {
      'playlist_name': playlist_name,
      'created_time': nowDate.toString(),
    });
  }

  Future<List<Playlist>> getAllPlaylists() async {
    var db = await database;
    List<Playlist> musicsList = [];
    var musics = await db.query('playlist');
    for (var music in musics) {
      musicsList.add(Playlist.fromJSON(music));
    }
    return musicsList;
  }

  Future<void> deletePlaylist(int id) async {
    var db = await database;
    await db.rawDelete('DELETE FROM playlist WHERE id = $id');
    await db.rawDelete('DELETE FROM music_in_playlist WHERE playlist_id = $id');
  }
}
