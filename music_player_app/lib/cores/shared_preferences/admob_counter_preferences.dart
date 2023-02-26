import 'package:shared_preferences/shared_preferences.dart';

class AdmobPreferencesCounter {
  Future<SharedPreferences> get getPrefs async =>
      await SharedPreferences.getInstance();

  Future<void> setPreferences() async {
    var prefs = await getPrefs;
    if (prefs.getInt('admobCount') != null) {
      int count = prefs.getInt('admobCount')!.toInt();
      await prefs.setInt('admobCount', count + 1);
    } else {
      await prefs.setInt('admobCount', 1);
    }
  }

  Future<void> setZeroPreference() async {
    var prefs = await getPrefs;
    await prefs.setInt('admobCount', 0);
  }

  Future<int> getPreferences() async {
    var prefs = await getPrefs;
    int? count = prefs.getInt('admobCount');

    if (count != null) {
      return count;
    } else {
      return 0;
    }
  }
}
