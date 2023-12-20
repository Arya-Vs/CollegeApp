import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
part 'teacher_add.g.dart';
@HiveType(typeId: 2)
class Teacher {
  @HiveField(0)
  final String department;
  @HiveField(1)
  final String sem1;
  @HiveField(2)
  final String sem2;
  @HiveField(3)
  final String sem3;
  @HiveField(4)
  final String sem4;
  @HiveField(5)
  final String sem5;
  @HiveField(6)
  final String sem6;
  Teacher(
      {required this.department,
      required this.sem1,
      required this.sem2,
      required this.sem3,
      required this.sem4,
      required this.sem5,
      required this.sem6,
      });
}
