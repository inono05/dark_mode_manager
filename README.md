# Dark Mode Manager

A Flutter package that provides a complete solution for managing dark/light theme in your Flutter applications. This package offers an easy-to-use API for toggling between themes and persisting user preferences using Riverpod for state management.

## Features

- 🌓 Toggle between light and dark themes
- 💾 Automatically persists theme preferences
- 🎨 Seamless integration with Flutter's Theme system
- 🏗️ Built with clean architecture principles
- 🔄 Reactive theme updates throughout the app
- 📱 Supports both mobile and web platforms
- ⚡ Riverpod integration for state management

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_riverpod: ^2.0.0  # Required for state management
  dark_mode_manager: ^1.0.0  # Use the latest version
```

## Quick Start

### 1. Initialize the App

```dart
import 'package:dark_mode_manager/dark_mode_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeLocalSource.ensureInitialized();
  
  runApp(
    UncontrolledProviderScope(
      container: ProviderContainer(),
      child: const MyApp(),
    ),
  );
}
```

### 2. Set Up Your App with Theme

```dart
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeControllerProvider);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: mode,
      darkTheme: AppTheme.darkTheme,  // Your custom dark theme
      theme: AppTheme.lightTheme,     // Your custom light theme
      home: const MyHomePage(title: 'Dark Mode Demo'),
    );
  }
}
```

### 3. Add Theme Toggle to Your UI

```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Change the theme:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const ThemeSwitcher(),  // Add the theme switcher widget
          ],
        ),
      ),
    );
  }
}
```

## Advanced Usage

### Programmatic Theme Control

```dart
// Toggle theme programmatically
final themeNotifier = ref.read(themeControllerProvider.notifier);
await themeNotifier.toggleTheme();

// Get current theme mode
final currentMode = ref.read(themeControllerProvider);
```

### Customizing the Theme Switcher

The `ThemeSwitcher` widget can be customized with various properties:

```dart
ThemeSwitcher(
  size: 50.0,  // Custom size
  padding: const EdgeInsets.all(8.0),
  onToggle: (isDark) {
    // Optional callback when theme changes
    debugPrint('Theme changed to: ${isDark ? 'Dark' : 'Light'}')
  },
)
```

## Theming

Define your custom themes in a separate file (e.g., `app_theme.dart`):

```dart
class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // Add your light theme configurations
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // Add your dark theme configurations
  );
}
```

## Example App

For a complete working example, check the `example/` directory in the package.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you find this package useful, consider giving it a ⭐ on [GitHub](https://github.com/yourusername/dark_mode_manager).

For any issues or feature requests, please file an issue on the [GitHub repository](https://github.com/yourusername/dark_mode_manager/issues).
