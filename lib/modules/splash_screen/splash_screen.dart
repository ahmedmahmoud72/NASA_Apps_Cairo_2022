import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nasa_space_apps_2022/modules/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  final bool? login;

  const SplashScreen({
    this.login,
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool? _shared;
    SharedPreferences.getInstance().then((value) {
      _shared = value.getBool('LOGIN');
      print(_shared);
      Timer(const Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route route) => false);
        }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/NASA.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
        ),
      ),
    );
  }
}
