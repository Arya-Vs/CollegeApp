import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/department/teacher_add.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/addingscreens/add_student.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/navigation.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/studentscreens/studentdisplay_scrn.dart';
import 'package:newcollege_app/edit_screens/editstudent_scrn.dart';

class StudentList extends StatefulWidget {
  final String? selectedDepartment;
  final String? departmentKey;
  const StudentList({Key? key, this.selectedDepartment, this.departmentKey}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  String query = '';
  List<Student> studentList = [];

  Future<void> getdata() async {
    final studentlists = await getAllStudents();
   final studentlistOfDepartment = studentlists.where((element) => element.departmentKey == widget.departmentKey).toList();
   print('Selected Department Key: ${widget.departmentKey}');

    setState(() {
      studentList = studentlistOfDepartment;
    });
  }

  Future<void> deleteStudentAndUpdateList(String studentId) async {
    await deleteStudent(studentId);

    setState(() {
      studentList.removeWhere((student) => student.studentkey == studentId);
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Column(
          children: [
            AppBar(
              backgroundColor: const Color.fromARGB(255, 21, 67, 105),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BottomNavWidget(),
                  ));
                },
              ),
              title: const Column(
                children: [
                  Text("Students"),
                  // Text(widget.selectedDepartment ?? "", style: const TextStyle(fontSize: 16.0)),
                ],
              ),
              centerTitle: true,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 21, 67, 105),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 247, 242, 242),
                  filled: true,
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  ////////search//////////
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    studentList[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                ///////////////EDIT///////////////////////
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext ctx) =>
                          EditScreen(students: studentList[index]),
                    ));
                  },
                ),

                IconButton(
                    onPressed: () {
                      String key = studentList[index].studentkey.toString();
                      deleteStudent(key);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext ctx) => const StudentList()));
                    },
                    icon: const Icon(Icons.delete)),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    DisplayScreen(students: studentList[index]),
              )
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(widget.departmentKey);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  AddScreen(selectedDepartmentKey: widget.departmentKey),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
      ),
    );
  }
}
