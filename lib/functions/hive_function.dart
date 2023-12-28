import 'package:hive_flutter/hive_flutter.dart';
import 'package:newcollege_app/model/department/teacher_add.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/model/timetable/timetable_model.dart';

// to add a new student
Future<void> addStudentData(student values) async {
  final box = await Hive.openBox<student>('student_db');
  String key = DateTime.now().millisecondsSinceEpoch.toString();
  values.studentkey=key;
    await box.put(key, values);
  print(box.values.toList());
}

// to get students data
Future<List<student>> getAllStudents() async {
  final box = await Hive.openBox<student>('student_db');
  return box.values.toList();
}

// to delete a student
  Future<void> deleteStudent(String studentId) async {
  final box = await Hive.openBox<student>('student_db');
  await box.delete(studentId);
  
}


// to add a department
Future<void> addDepartment(Teacher values) async {
  final box = await Hive.openBox<Teacher>('teacher_db');
  String key = DateTime.now().millisecondsSinceEpoch.toString();
  values.departementKey=key;
  await box.put(key, values);
}


// to get departement details
Future<List<Teacher>> getAllDepartments() async {
  final box = await Hive.openBox<Teacher>('teacher_db');
  return box.values.toList();
}

// to delete a student
  Future<void> deleteDepartemnt(String departmentId) async {
  final box = await Hive.openBox<Teacher>('teacher_db');
  await box.delete(departmentId);
}



// to add a timetable
Future<void>addTimeTable(TimeTableModel values)async{
final box =await Hive.openBox<TimeTableModel>('timetable_db');
 String key = DateTime.now().millisecondsSinceEpoch.toString();
 values.timetablekey=key;
await box.put(key, values);
}

// to get timetable details
Future<List<TimeTableModel>> getAllTimetable() async {
  final box = await Hive.openBox<TimeTableModel>('timetable_db');
  return box.values.toList();

}

// to delete a timetable
Future<void> deleteTimetable(String timetableId) async {
  final box = await Hive.openBox<TimeTableModel>('timetable_db');
  await box.delete(timetableId);
}


