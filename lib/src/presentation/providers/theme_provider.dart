import 'package:dark_mode_manager/src/domain/entities/theme_mode_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../domain/usecases/get_mode_usecase.dart';
import '../../domain/usecases/providers/get_mode_usecase_provider.dart';
import '../../domain/usecases/providers/set_mode_usecase_provider.dart';
import '../../domain/usecases/set_mode_usecase.dart';

class ThemeController extends StateNotifier<ThemeMode> {
  final GetModeUseCase _getModeUseCase;
  final SetModeUseCase _setModeUseCase;

  ThemeController(this._getModeUseCase, this._setModeUseCase)
    : super(ThemeMode.system) {
    toggleTheme();
  }

  Future<void> toggleTheme() async {
    final mode = await _getModeUseCase.call();
    state = toFlutterMode(mode);
  }

  Future<void> setTheme(ThemeModeEntity mode) async {
    await _setModeUseCase(mode);
    state = toFlutterMode(mode);
  }

  ThemeMode toFlutterMode(ThemeModeEntity entity) {
    switch (entity) {
      case ThemeModeEntity.light:
        return ThemeMode.light;
      case ThemeModeEntity.dark:
        return ThemeMode.dark;
      case ThemeModeEntity.system:
        return ThemeMode.system;
    }
  }
}

final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeMode>((ref) {
      final getModeUseCase = ref.watch(getModeUseCaseProvider);
      final setModeUseCase = ref.watch(setModeUseCaseProvider);
      return ThemeController(getModeUseCase, setModeUseCase);
    });
