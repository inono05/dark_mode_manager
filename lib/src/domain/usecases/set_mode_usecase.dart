import '../../../dark_mode_manager.dart';

class SetModeUseCase {
  final ThemeRepository repository;
  SetModeUseCase(this.repository);

  Future<void> call(ThemeModeEntity mode) => repository.saveTheme(mode);
}
