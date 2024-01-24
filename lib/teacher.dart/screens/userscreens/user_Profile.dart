import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/teacher.dart/screens/auth/userside/login.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_home.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_navigation/navigationbar_students.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentDetails extends StatefulWidget {
  String stuKey;
  StudentDetails({super.key, required this.stuKey});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  Student? selectedStudent;
  String? emailOfStudent;

  @override
  void initState() {
    fetchEmailOfStudent();
    super.initState();
  }

  Future<void> fetchEmailOfStudent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('userEmail');
    print('email in sharedpreference is $email');
    setState(() {
      emailOfStudent = email;
    });
    print('email from sharedpreference is $emailOfStudent');

    if (emailOfStudent == null) {
      print('email is null');
      return;
    }

    try {
      final box = await Hive.openBox<Student>('student_db');
      if (!box.isOpen) {
        print('Error opening Hive box');
        return;
      }

      final studentFromDb = box.values.firstWhere(
        (element) => element.email == emailOfStudent,
      );
      setState(() {
        selectedStudent = studentFromDb;
      });

      print('the selected student is ${studentFromDb.email}');
    } catch (e) {
      print("Student not found: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 67, 105),
      appBar: buildAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: buildStudentDetails(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 21, 67, 105),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StudentHome(),
            ),
          );
        },
      ),
      title: const Text("Profile"),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("LOGOUT"),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.clear().then((value) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const StudentLogin(),
                            ),
                            (Route route) => false,
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
                      ),
                      child: const Text("YES"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
                      ),
                      child: const Text("NO"),
                    )
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.logout_sharp),
        ),
      ],
    );
  }

  Widget buildStudentDetails() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Display the image
          if (selectedStudent?.imagePath != null)
            buildStudentImage(File(selectedStudent!.imagePath)),

          const SizedBox(height: 16),

          // Display other student details
          buildDetailTile("Name", selectedStudent?.name, 'No Name'),
          buildDetailTile("Phone", selectedStudent?.phone, 'No Phone number'),
          buildDetailTile("Gender", selectedStudent?.gender, 'No Gender'),
          buildDetailTile("Date of Birth", selectedStudent?.dob, 'No DOB'),
          buildDetailTile( "Father's Name", selectedStudent?.fatherName, 'No Father'),
          buildDetailTile("Mother's Name", selectedStudent?.motherName, 'No Mother'),
          buildDetailTile("Address", selectedStudent?.address, 'No Address'),
          buildDetailTile("District", selectedStudent?.district, 'No District'),
          buildDetailTile("Department", selectedStudent?.department, 'No Department'),
          buildDetailTile("Academic Year", selectedStudent?.academicYear,'No Academic Year'),
          buildDetailTile("Roll Number", selectedStudent?.rollnumber, 'No Roll NUmber'),
          buildDetailTile("Email", selectedStudent?.email, 'No Email'),
        ],
      ),
    );
  }

  Widget buildStudentImage(File imageFile) {
    return CircleAvatar(
      radius: 70,
      backgroundImage: FileImage(imageFile),
    );
  }

  Widget buildDetailTile(String title, String? value, String defaultValue) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value ?? defaultValue,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
