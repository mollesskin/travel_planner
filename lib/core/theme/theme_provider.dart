import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

const String _prefIsDarkKey = 'isDark';
const String _prefSelectedTabKey = 'selectedTab';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  final prefs = ref.read(sharedPrefsProvider);
  return ThemeNotifier(prefs);
});

class ThemeNotifier extends StateNotifier<bool> {
  final SharedPreferences _prefs;

  ThemeNotifier(this._prefs) : super(_prefs.getBool(_prefIsDarkKey) ?? false);

  void toggleTheme() {
    state = !state;
    _prefs.setBool(_prefIsDarkKey, state);
  }
}

final selectedTabProvider = StateNotifierProvider<TabNotifier, int>((ref) {
  final prefs = ref.read(sharedPrefsProvider);
  return TabNotifier(prefs);
});

class TabNotifier extends StateNotifier<int> {
  final SharedPreferences _prefs;
  TabNotifier(this._prefs) : super(_prefs.getInt(_prefSelectedTabKey) ?? 0);

  void setTab(int index) {
    state = index;
    _prefs.setInt(_prefSelectedTabKey, index);
  }
}
