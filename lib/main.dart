import 'package:codelandia_news/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        // brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: const MainScreen(),
    );
  }
}
