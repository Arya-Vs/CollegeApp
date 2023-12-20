import 'package:flutter/material.dart';
import 'package:newcollege_app/model/hive_function.dart';
import 'package:newcollege_app/model/student_model.dart';
import 'package:newcollege_app/teacher.dart/add_student.dart';
import 'package:newcollege_app/teacher.dart/display_scrn.dart';
import 'package:newcollege_app/teacher.dart/edit_scrn.dart';

class StudentList extends StatefulWidget {
  final String? selectedDepartment;
    const StudentList({Key? key, this.selectedDepartment}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  String query = '';
  List<student> studentList = [];

  Future<void> getdata() async {
    List<student> studentlists = await getAllStudents();
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Column(
          children: [
            AppBar(
              backgroundColor: const Color.fromARGB(255, 21, 67, 105),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: const Column(
                children: [
                  Text("Students"),
              
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext ctx) =>
                          EditScreen(students: studentList[index]),
                    ));
                  },
                ),
                IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext ctx) =>StudentList()
                         
                    ));
                }, icon: Icon(Icons.delete)),
              ],
            ),
            
            onTap: () {
              print(studentList[index]);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    DisplayScreen(students: studentList[index]),
              ));
            },
            
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );
        },
        child:  const Icon(Icons.add),
        backgroundColor:const Color.fromARGB(255, 21, 67, 105),
      ),
    );
  }
}