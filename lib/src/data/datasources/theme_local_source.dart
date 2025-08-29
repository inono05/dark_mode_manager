import 'package:hive_flutter/adapters.dart';

import '../../../dark_mode_manager.dart';

class ThemeLocalSource {
  static const _boxName = 'themeBox';
  static late Box _box;

  static Future<void> ensureInitialized() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  ThemeModeEntity getTheme() {
    final mode = _box.get('mode', defaultValue: ThemeModeEntity.system.index);
    if (mode == null) return ThemeModeEntity.system;
    return ThemeModeEntity.values[mode];
  }

  Future<void> saveTheme(ThemeModeEntity mode) async {
    await _box.put('mode', mode.index);
  }
}
