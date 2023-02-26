// ignore_for_file: non_constant_identifier_names

import 'package:music_player_app/cores/local_db_services/local_db_service.dart';
import 'package:music_player_app/models/music.dart';
import 'package:sqflite/sqflite.dart';

class LocalDbMusicService extends LocalDbService {
  Future<void> addMusic(
      {required String music_name,
      required String music_path,
      required String music_id}) async {
    var db = await database;
    await db.insert('music', {
      'music_name': music_name,
      'music_path': music_path,
      'datetime': nowDate.toString(),
      'music_id': music_id,
    });
  }

  Future<List<Music>> getAllDownloadedMusics() async {
    var db = await database;
    List<Music> musicsList = [];
    var musics = await db.query('music');
    for (var music in musics) {
      musicsList.add(Music.fromJSON(music));
    }
    return musicsList;
  }

  Future<int> getCountDownloadedMusics() async {
    var db = await database;

    int? count =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM music'));
    return count!;
  }

  Future<void> deleteMusic(int musicId) async {
    var db = await database;
    await db.rawDelete('DELETE FROM music WHERE id = $musicId');
  }

  Future<bool> musicControl(String videoId) async {
    var db = await database;

    int? value = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM music WHERE music_id = $videoId'),
    );

    if (value == null) return false;
    if (value == 0) {
      return false;
    } else {
      return true;
    }
  }
}
