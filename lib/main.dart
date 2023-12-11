import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newcollege_app/model/student_model.dart';
import 'package:newcollege_app/model/user_model.dart';
import 'package:hive/hive.dart';
import 'package:newcollege_app/screens/splash_scrn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter<student>(studentAdapter());
  await Hive.openBox<User>('users');  
  await Hive.openBox<student>('student');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


