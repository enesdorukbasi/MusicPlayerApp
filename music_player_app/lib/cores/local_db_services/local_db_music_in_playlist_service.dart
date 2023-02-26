// ignore_for_file: non_constant_identifier_names

import 'package:music_player_app/cores/local_db_services/local_db_service.dart';
import 'package:music_player_app/models/music.dart';
import 'package:music_player_app/models/music_in_playlist.dart';
import 'package:sqflite/sqflite.dart';

class LocalDbMusicInPlaylistService extends LocalDbService {
  Future<void> addMusicInPlaylist({
    required int music_id,
    required int playlist_id,
  }) async {
    var db = await database;
    await db.insert('music_in_playlist', {
      'music_id': music_id,
      'playlist_id': playlist_id,
      'created_time': nowDate.toString(),
    });
  }

  Future<List<MusicInPlaylist>> getAllMusicInPlaylists() async {
    var db = await database;
    List<MusicInPlaylist> musicsList = [];
    var musics = await db.query('music_in_playlist');
    for (var music in musics) {
      musicsList.add(MusicInPlaylist.fromJSON(music));
    }
    return musicsList;
  }

  Future<int> getCountDownloadedMusics(int playlist_id) async {
    var db = await database;

    int? count = Sqflite.firstIntValue(await db.rawQuery(
        'SELECT COUNT(*) FROM music_in_playlist WHERE playlist_id =  $playlist_id'));
    return count!;
  }

  Future<List<Music>> getAllMusicByPlaylistsId(int playlist_id) async {
    var db = await database;
    List<Music> musicsList = [];
    List<MusicInPlaylist> musicInPlaylist = [];
    var musicInPlaylistsQuery = await db.query("music_in_playlist",
        where: 'playlist_id = ?', whereArgs: [playlist_id + 1]);
    for (var item in musicInPlaylistsQuery) {
      musicInPlaylist.add(MusicInPlaylist.fromJSON(item));
    }
    for (var item in musicInPlaylist) {
      var musicJSON =
          await db.query("music", where: 'id = ?', whereArgs: [item.music_id]);
      musicsList.add(Music.fromJSON(musicJSON[0]));
    }
    return musicsList;
  }

  Future<void> deleteMusicInPlaylist(int musicId, int playlistId) async {
    var db = await database;
    await db.rawDelete(
        'DELETE FROM music_in_playlist WHERE music_id = $musicId and playlist_id = $playlistId');
  }
}
