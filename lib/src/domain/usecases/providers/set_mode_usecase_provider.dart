import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/theme_repository_impl_provider.dart';
import '../set_mode_usecase.dart';

final setModeUseCaseProvider = Provider<SetModeUseCase>((ref) {
  final repository = ref.watch(themeRepositoryProvider);
  return SetModeUseCase(repository);
});
