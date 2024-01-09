import 'package:flutter/material.dart';
import 'package:newcollege_app/edit_screens/edit_department.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/department/teacher_add.dart';
import 'package:newcollege_app/syllabus_screen/admin_syllabus.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/addingscreens/add_deptment.dart';
import 'package:newcollege_app/teacher.dart/screens/auth/userside/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Teacher> depdetails = [];

  Future<void> fetchdepartmentdata() async {
    List<Teacher> depdetail = await getAllDepartments();
    setState(() {
      depdetails = depdetail;
    });
  }

  Future<void> deleteItem(String departmentId) async {
    final confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Department'),
        content: const Text('Are you sure you want to delete this department?'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false); ///// Don't delete //////
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 21, 67, 105),
            ),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop(true); ///////// Delete //////
              await deleteDepartemnt(departmentId);
              fetchdepartmentdata();
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Department deleted'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 21, 67, 105),
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
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
        title: const Text('Admin Home'),
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
                          backgroundColor:
                              const Color.fromARGB(255, 21, 67, 105),
                        ),
                        child: const Text("YES"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 21, 67, 105),
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
      // body: Text("hai"),
   body: depdetails.isEmpty
    ? const Center(child: Text("No data is available"))
    : Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.03,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: depdetails.length,
            itemBuilder: (context, index) {
              return InkWell(
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
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 21, 67, 105),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            depdetails[index].department,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 120,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditDepartment(
                                    department: depdetails[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 150,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          deleteItem(depdetails[index].departementKey!);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),

        // ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDeparments(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        child: const Icon(Icons.add),
      ),
    );
  }
}
