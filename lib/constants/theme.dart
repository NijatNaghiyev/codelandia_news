import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeLight = ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
  ),
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: GoogleFonts.openSansTextTheme(),
);
ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  textTheme: GoogleFonts.openSansTextTheme(),
);
