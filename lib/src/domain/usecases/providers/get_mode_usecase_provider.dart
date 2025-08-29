import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/theme_repository_impl_provider.dart';
import '../get_mode_usecase.dart';

final getModeUseCaseProvider = Provider<GetModeUseCase>((ref) {
  final repository = ref.watch(themeRepositoryProvider);
  return GetModeUseCase(repository);
});
