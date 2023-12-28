import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newcollege_app/model/department/teacher_add.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/model/timetable/timetable_model.dart';
import 'package:newcollege_app/model/user/user_model.dart';
import 'package:newcollege_app/screens/splashscreen/splash_scrn.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter<Teacher>(TeacherAdapter());
  Hive.registerAdapter<student>(studentAdapter());
  Hive.registerAdapter<TimeTableModel>(TimeTableModelAdapter());
  await Hive.openBox<User>('users'); 
  
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


