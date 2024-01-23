import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/department/teacher_add.dart';
import 'package:newcollege_app/syllabus_screen/admin_syllabus.dart';

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
    print('data $depdetails');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        title: const Text("Student Home"),
        centerTitle: true,

        /////////////////////////////
        
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
              );
            });
          }, icon:Icon(Icons.settings),)
        ],

        
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/graduaioncap.png",
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
          if (depdetails.isEmpty)
            Center(child: Text("No data is available"))
          else
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: depdetails.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 21, 67, 105),
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      title: Text(
                        depdetails[index].department,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Syllabus(
                              teacher: depdetails[index],
                              department: depdetails[index].department,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
