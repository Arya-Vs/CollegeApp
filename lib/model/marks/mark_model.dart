
import 'package:hive_flutter/adapters.dart';
part 'mark_model.g.dart';


@HiveType(typeId :4)
class Markmodel{
  @HiveField(0)
   String semester;
  @HiveField(1)
  final String subject1;
  @HiveField(2)
  final String subject2;
  @HiveField(3)
  final String subject3;
  @HiveField(4)
  final String subject4;
  @HiveField(5)
  final String subject5;
  @HiveField(6)
  final String subject6;
  @HiveField(7)
  final String total;

  @HiveField(8)
  String ?markkey;
  @HiveField(9)
  String ?studentId;
  Markmodel({
    required this.semester,
    required this.subject1,
    required this.subject2,
    required this.subject3,
    required this.subject4,
    required this.subject5,
    required this.subject6,
    required this.total,
    this.markkey,
   required this.studentId
  });

  get marks => null;

  get department => null;
}
