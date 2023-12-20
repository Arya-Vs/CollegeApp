import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
part 'timetable_model.g.dart';

@HiveType(typeId: 3)
class TimeTableModel{
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final String subject;

 TimeTableModel(
      {required this.date,
      required this.time,
      required this.subject,
     
      });

  
}
  



