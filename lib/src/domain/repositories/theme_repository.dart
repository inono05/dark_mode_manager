import '../entities/theme_mode_entity.dart';

abstract class ThemeRepository {
  Future<void> saveTheme(ThemeModeEntity themeMode);
  Future<ThemeModeEntity> getTheme();
}
