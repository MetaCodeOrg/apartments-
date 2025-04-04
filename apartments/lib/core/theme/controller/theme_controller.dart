import 'package:flutter_app/core/pereferences/shared_pref.dart';
import 'package:mc_utils/mc_utils.dart';

class ThemeController extends GetxController implements GetxService {
  ThemeController() {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    SharedPrefs.setBoolean(SharedPrefs.themeApp, _darkTheme);
    update();
  }

  void changeThemeToWhite() {
    _darkTheme = false;
    SharedPrefs.setBoolean(SharedPrefs.themeApp, _darkTheme);
    update();
  }

  void _loadCurrentTheme() async {
    var theme = SharedPrefs.getBoolean(SharedPrefs.themeApp);
    _darkTheme = theme;
    update();
  }
}
