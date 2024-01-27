import 'package:hive_flutter/hive_flutter.dart';
import 'package:newcollege_app/model/department/teacher_add.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/model/timetable/timetable_model.dart';

// to add a new student
Future<void> addStudentData(Student values) async {
  final box = await Hive.openBox<Student>('student_db');
  String key = DateTime.now().millisecondsSinceEpoch.toString();
  values.studentkey=key;
    await box.put(key, values);
  // print(box.values.toList());
}

// to get students data
Future<List<Student>> getAllStudents() async {
  final box = await Hive.openBox<Student>('student_db');
  if (box.isNotEmpty) { 
    return box.values.toList();
  } else {
    return []; // or handle the case when no values are available
  }
}

// to delete a student
  Future<void> deleteStudent(String studentId) async {
  final box = await Hive.openBox<Student>('student_db');
  await box.delete(studentId);
  
}

// // to edit a student
Future<void> editStudent(Student editStudent, String key) async {
  final box = await Hive.openBox<Student>('student_db');
  
  if (editStudent.studentkey == null) {
    await box.put(key, editStudent);
  } else {
    print('Student with key ${editStudent.studentkey} already has a value.');
  }
}


/////////////////DEPARTMENT FUNCTION////////////////////



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

// to delete a dedpartment
  Future<void> deleteDepartemnt(String departmentId) async {
  final box = await Hive.openBox<Teacher>('teacher_db');
  await box.delete(departmentId);
}

// to edit a department
// Future<void> editDepartment(Teacher editDepartment, String key) async {
//   final box = await Hive.openBox<Student>('student_db');
  
//   if (editDepartment.departementKey == null) {
//     await box.put(key, editDepartment as Student);
//   } else {
//     print('Student with key ${editDepartment.departementKey} already has a value.');
//   }
// }


///////////////  TIME TABLE FUNCTIONS  //////////////////////////

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


// to edit a timetable
Future<void> editTime(TimeTableModel editTime, String key) async {
  final box = await Hive.openBox<TimeTableModel>('timetable_db');
  
  if (editTime.timetablekey == null) {
    await box.put(key, editTime);
  } else {
    print('Timetable with key ${editTime.timetablekey} already has a value.');
  }
}

//////////   mark   ////////

// add mark
 Future<void>addMarkData(Markmodel values) async {
    final box = await Hive.openBox<Markmodel>('mark_db');
    String key = DateTime.now().millisecondsSinceEpoch.toString();
    values.markkey = key;
    await box.put(key, values);
    print('markkey - ${values.markkey}');
    print(box.values.toList());
  }

//getmark
Future<List<Markmodel>> getmark() async {
  final box = await Hive.openBox<Markmodel>('mark_db');
  return box.values.toList();
}

//to delete marks
Future<void> deletemark(String studentId) async {
  final box = await Hive.openBox<Markmodel>('mark_db');
  await box.delete(studentId);
}


//to edit marks

Future<void>editmark(Markmodel markedit, String key) async {
  final box = await Hive.openBox<Markmodel>('mark_db');
  
  if (markedit.markkey == null) {
    await box.put(key, markedit);
  } else {
    print('Timetable with key ${markedit.markkey} already has a value.');
  }
}



