import '../../../dark_mode_manager.dart';

class GetModeUseCase {
  final ThemeRepository repository;
  GetModeUseCase(this.repository);

  Future<ThemeModeEntity> call() => repository.getTheme();
}
