import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/department/teacher_add.dart';
import 'package:newcollege_app/teacher.dart/screens/auth/userside/login.dart';
import 'package:newcollege_app/syllabus_screen/admin_syllabus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  List<Teacher> depdetails = [];

  Future<void> fetchdepartmentdata() async {
    List<Teacher> fetchedDepDetails = await getAllDepartments();
    setState(() {
      depdetails = fetchedDepDetails;
    });
  }

  @override
  void initState() {
    fetchdepartmentdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        title: const Text("Student Home"),
        centerTitle: true,
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
                            // Navigate to the login page
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
      ),
      body: depdetails.isEmpty
          ? const Center(child: Text("No data is available"))
          : ListView.builder(
              itemCount: depdetails.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(depdetails[index].department),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Syllabus(
                                teacher: depdetails[index],
                                department: depdetails[index].department)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
