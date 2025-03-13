import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player/pages/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            CupertinoColors.darkBackgroundGray,
            CupertinoColors.systemGrey,
            Colors.white,
            CupertinoColors.systemGrey,
            CupertinoColors.darkBackgroundGray,
          ],
        ),
      ),
      child: AnimatedSplashScreen(
        duration: 3000,
        splash: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset(
              'assets/animations/Animation - 1714929978176.json',
              height: 300,
              width: 300,
              repeat: false,
              animate: true,
            ),
            const Positioned(
              bottom: 15,
              child: Text(
                'S P O T T Y P L A Y',
                style: TextStyle(
                  color: Color.fromARGB(255, 107, 107, 107),
                  fontSize: 20,
                  fontFamily: 'REM',
                ),
              ),
            ),
          ],
        ),
        nextScreen: const HomePage(),
        backgroundColor: const Color.fromARGB(0, 144, 138, 138),
        splashIconSize: 300,
      ),
    );
  }
}
