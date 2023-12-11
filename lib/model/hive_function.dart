
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newcollege_app/model/student_model.dart';

Future<void>addStudentdata(student values)async{
final box = await Hive.openBox<student>('student_db');
await box.add(values);
print(box.values.toList());
}

 Future<List<student>> getAllStudents() async {
    final box = await Hive.openBox<student>('student_db');
    return box.values.toList();
  }