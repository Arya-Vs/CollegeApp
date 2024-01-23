import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserMark extends StatefulWidget {
  const UserMark({Key? key}) : super(key: key);

  @override
  State<UserMark> createState() => _UserMarkState();
}

class _UserMarkState extends State<UserMark> {
  List<Markmodel> markdetails = [];
  Student? selectedStudent;
  String? emailOfStudent;
  List<Markmodel> studentMarks = [];

  Future<void> fetchEmailOfStudent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('userEmail');
    print('email in sharedpreference is $email');
    setState(() {
      emailOfStudent = email;
    });
    print('email from sharedpreference is $emailOfStudent');

    if (emailOfStudent == null) {
      // Handle the case where emailOfStudent is null.
      print('email is null');
      return;
    }

    try {
      final studentBox = await Hive.openBox<Student>('student_db');
      final markBox = await Hive.openBox<Markmodel>('mark_db');

      // Check if the boxes are open successfully
      if (!studentBox.isOpen || !markBox.isOpen) {
        print('Error opening Hive box');
        return;
      }

      final studentFromDb = studentBox.values.firstWhere(
        (element) => element.email == emailOfStudent,
      );

      setState(() {
        selectedStudent = studentFromDb;
      });

      // Retrieve marks for the selected student
      final marksForStudent = markBox.values
          .where((mark) => mark.studentId == selectedStudent?.studentkey)
          .toList();

      setState(() {
        studentMarks = marksForStudent;
      });

      // Do something with the studentFromDb and studentMarks.
      print('the selected student is ${studentFromDb.email}');
      print(studentMarks.length);
    } catch (e) {
      // Handle the case where no student is found with the specified email.
      print("Error: $e");
    }
  }

  @override
  void initState() {
    fetchEmailOfStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 67, 105),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StudentHome(),
            ));
          },
        ),
        title: const Text("Marks"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: studentMarks.length,
        itemBuilder: (context, index) {
          final mark = studentMarks[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${mark.semester}',
                    style: const TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Name: ${selectedStudent?.name ?? ''}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' ${selectedStudent?.email ?? ''}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Subject 1: ${mark.subject1}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Subject 2: ${mark.subject2}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Subject 3: ${mark.subject3}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Subject 4: ${mark.subject4}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Subject 5: ${mark.subject5}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Subject 6: ${mark.subject6}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Total Marks: ${mark.total}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}