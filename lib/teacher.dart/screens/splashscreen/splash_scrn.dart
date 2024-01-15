import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:newcollege_app/teacher.dart/screens/auth/userside/login.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_navigation/navigationbar_students.dart';
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
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  NavStudents(stuKey: '',)));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const StudentLogin()));
    }
  }
}

Future<bool> findIsUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Check if userKey is present in SharedPreferences
  log('checking user');
  return prefs.containsKey('userKey');
}
