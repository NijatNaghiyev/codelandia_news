import 'dart:async';

import 'package:codelandia_news/screens/setting_screen.dart';
import 'package:codelandia_news/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'constants/theme.dart';

void main() {
  runApp(const MyApp());
}

ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void changeDarkMode() {
    Timer(Duration.zero, () {
      setState(() {});
    });
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
  }

  @override
  void initState() {
    super.initState();
    isDarkMode.addListener(() {
      changeDarkMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom News',
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: themeMode.value,
      home: const SplashScreen(),
    );
  }
}
