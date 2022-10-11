import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import '../Auth/switch/switch_screen.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/logo.png'),
      durationInSeconds: 5,
      showLoader: false,
      navigator:const SwitchScreen(),
    );
  }
}
