import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class  Student  {
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
  String department;

  @HiveField(9)
  String academicYear;

  @HiveField(10)
  String rollnumber;


 @HiveField(11)
  String email;

  @HiveField(12)
  String imagePath; 

  
  @HiveField(13)
  String ?studentkey; 



  Student({
    required this.name,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.fatherName,
    required this.motherName,
    required this.address,
    required this.district,
    required this.department,
    required this.academicYear,
    required this.rollnumber,
    required this.email,
    required this.imagePath,
    this.studentkey
  });
}
