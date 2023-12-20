import 'package:hive_flutter/hive_flutter.dart';
import 'package:newcollege_app/model/student_model.dart';
import 'package:newcollege_app/model/teacher_add.dart';
import 'package:newcollege_app/model/timetable_model.dart';

Future<void> addStudentData(student values) async {
  final box = await Hive.openBox<student>('student_db');
 
    await box.add(values);
  
  print(box.values.toList());
}

Future<List<student>> getAllStudents() async {
  final box = await Hive.openBox<student>('student_db');
  return box.values.toList();
}

Future<void> addDepartment(Teacher values) async {
  final box = await Hive.openBox<Teacher>('teacher_db');
    await box.add(values);
  
}
Future<List<Teacher>> getAllDepartments() async {
  final box = await Hive.openBox<Teacher>('teacher_db');
  return box.values.toList();

}
Future<void>addTimeTable(TimeTableModel values)async{
final Box =await Hive.openBox<TimeTableModel>('timetable_db');
await Box.add(values);
}
Future<List<TimeTableModel>> getAllTimetable() async {
  final box = await Hive.openBox<TimeTableModel>('timetable_db');
  return box.values.toList();

}

