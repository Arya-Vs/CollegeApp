import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/addingscreens/mark_adding.dart';

class StudentMark extends StatefulWidget {
  const StudentMark({super.key});

  @override
  State<StudentMark> createState() => _StudentMarkState();
}

class _StudentMarkState extends State<StudentMark> {
  List<Student> studentList = [];

  Future<void> getdata() async {
    final studentlists = await getAllStudents();
    print(studentlists);
    setState(() {
      studentList = studentlists;
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Marks'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MarkView(student:studentList[index] ,)),
                );
              },
              title: Text(studentList[index].name),
            ),
          );
        },
      ),
    );
  }
}
