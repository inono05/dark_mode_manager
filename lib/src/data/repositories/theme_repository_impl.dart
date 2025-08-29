import '../../domain/entities/theme_mode_entity.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_local_source.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalSource localThemeSource;

  ThemeRepositoryImpl(this.localThemeSource);

  @override
  Future<ThemeModeEntity> getTheme() async {
    return localThemeSource.getTheme();
  }

  @override
  Future<void> saveTheme(ThemeModeEntity mode) async {
    await localThemeSource.saveTheme(mode);
  }
}
