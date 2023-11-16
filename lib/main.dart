import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/main/main_screen.dart';
import 'package:movie_app/ui/utils/app_theme.dart';
import 'domain/di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
        mainScreen.roteName : (context) => mainScreen(),
      },
      initialRoute: mainScreen.roteName,
    );
  }
}

