import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUser {
  static final SharedPreferencesUser _instace =
      new SharedPreferencesUser._internal();
  SharedPreferencesUser._internal();

  factory SharedPreferencesUser() {
    return _instace;
  }

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // Get y set
  String get houseId => _prefs.getString('houseID') ?? '';

  set houseId(String houseId) {
    _prefs.setString('houseID', houseId);
  }
}
