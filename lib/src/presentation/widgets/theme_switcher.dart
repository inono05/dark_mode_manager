import 'package:dark_mode_manager/dark_mode_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mode = ref.watch(themeControllerProvider);
    final textStyle = Theme.of(context).textTheme.headlineMedium;
    return SwitchListTile(
      title: Text(
        mode.name.capitalize(),
        style: textStyle?.copyWith(fontSize: 17.0),
      ),
      value: mode.name == "dark" ? true : false,
      onChanged: (value) => ref
          .read(themeControllerProvider.notifier)
          .setTheme(value ? ThemeModeEntity.dark : ThemeModeEntity.light),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
