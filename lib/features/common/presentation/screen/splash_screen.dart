import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lottie/lottie.dart';
import '../../../../core/utils/lang/size_config.dart';
import '../../../sign_in/presentation/screen/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? accessToken;
  getSignInResponse() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      // accessToken = sharedPreferences.getString("access_token");
      accessToken = sharedPreferences.getString("user_access_token");
    });
  }

  @override
  void initState() {
    super.initState();
    getSignInResponse();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: double.infinity,
        duration: 3000,
        splash: Lottie.asset('assets/json/TrackMattes.json'),
        nextScreen:
            accessToken == null ? const SignInScreen() : const Text('Test'),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color(0xffffffff),
      ),
    );
  }
}
