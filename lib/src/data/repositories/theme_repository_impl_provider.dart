import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dark_mode_manager.dart';

final themeRepositoryProvider = Provider<ThemeRepository>((ref) {
  return ThemeRepositoryImpl(ThemeLocalSource());
});
