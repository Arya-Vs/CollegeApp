import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:newcollege_app/screens/login_screen.dart';
import 'package:newcollege_app/screens/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isUserLoggedIn = false;
  @override
  void initState() {
    timetaking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/BoxAnimation.gif",
                width: 350.0,
                height: 200.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> timetaking() async {
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    final isuserlogged =await findIsUserLoggedIn();
    setState(() {
      isUserLoggedIn = isuserlogged ;
      log('$isUserLoggedIn');
    });
    if (isuserlogged == true) {
      log('user is logged in');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNavWidget()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }
}

Future<bool> findIsUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Check if userKey is present in SharedPreferences
  log('checking user');
  return prefs.containsKey('userKey');
}
