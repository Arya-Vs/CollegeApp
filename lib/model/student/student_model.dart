import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class  student  {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  @HiveField(2)
  String gender;

  @HiveField(3)
  String dob;

  @HiveField(4)
  String fatherName;

  @HiveField(5)
  String motherName;

  @HiveField(6)
  String address;

  @HiveField(7)
   String district;

  @HiveField(8)
  String pincode;

  @HiveField(9)
  String department;

  @HiveField(10)
  String academicYear;

  @HiveField(11)
  String teacherName;


  @HiveField(12)
  String imagePath; 

  
  @HiveField(13)
  String ?studentkey; 



  student({
    required this.name,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.fatherName,
    required this.motherName,
    required this.address,
    required this.district,
    required this.pincode,
    required this.department,
    required this.academicYear,
    required this.teacherName,
    required this.imagePath,
    this.studentkey
  });
}
