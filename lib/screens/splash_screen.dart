import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:codelandia_news/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Lottie.asset('assets/lottie/animation.json'),
      nextScreen: const MainScreen(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
