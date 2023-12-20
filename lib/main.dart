import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newcollege_app/model/student_model.dart';
import 'package:newcollege_app/model/teacher_add.dart';
import 'package:newcollege_app/model/timetable_model.dart';
import 'package:newcollege_app/model/user_model.dart';
import 'package:newcollege_app/screens/splash_scrn.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter<Teacher>(TeacherAdapter());
  Hive.registerAdapter<student>(studentAdapter());
  Hive.registerAdapter<TimeTableModel>(TimeTableModelAdapter());
  await Hive.openBox<User>('users');  
// await Hive.openBox<Teacher>('teacher_db');
//   await Hive.openBox<student>('student_db');
  
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


