import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class MusicPlayerPreferences {
  Future<SharedPreferences> get getPrefs async =>
      await SharedPreferences.getInstance();

  Future<void> setPreferences(
    bool bottomSheetIsActive,
    int activeMusicId,
    int activePlaylistId,
  ) async {
    var prefs = await getPrefs;
    final preferences = await StreamingSharedPreferences.instance;
    preferences.setBool('bottomSheetIsActive', bottomSheetIsActive);
    preferences.setInt('activeMusicId', activeMusicId);
    await prefs.setInt('activePlaylistId', activePlaylistId);
  }

  Future<void> deletePreferences({required bool bottomSheetIsActive}) async {
    var prefs = await getPrefs;
    final preferences = await StreamingSharedPreferences.instance;
    preferences.setBool('bottomSheetIsActive', bottomSheetIsActive);
    await prefs.remove('activeMusicId');
    await prefs.remove('activePlaylistId');
  }

  Future<List<Object?>> getPreferences() async {
    var prefs = await getPrefs;
    bool? bottomSheetIsActive = prefs.getBool('bottomSheetIsActive');
    int? activeMusicId = prefs.getInt('activeMusicId');
    int? activePlaylistId = prefs.getInt('activePlaylistId');

    return [bottomSheetIsActive, activeMusicId, activePlaylistId];
  }

  Future<bool?> isBottomSheetActive() async {
    var prefs = await getPrefs;
    return prefs.getBool('bottomSheetIsActive');
  }

  Future<void> setMusicIdPreferences(int musicId) async {
    final preferences = await StreamingSharedPreferences.instance;
    preferences.setInt('activeMusicId', musicId);
  }
}
