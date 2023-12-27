import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/teacher/teacher_add.dart';
import 'package:newcollege_app/screens/adminsreens/addingscreens/add_deptment.dart';
import 'package:newcollege_app/screens/auth/adminside/signup_screen.dart';
import 'package:newcollege_app/screens/auth/userside/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Teacher> depdetails = [];

  int currentIndex = 0;
  Future<void> fetchdepartmentdata() async {
    List<Teacher> depdetail = await getAllDepartments();
    setState(() {
      depdetails = depdetail;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
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
        title: const Text('Admin Home'),
        centerTitle: true,
        leading: IconButton(
    icon:const Icon(Icons.arrow_back),
   onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext ctx) =>SignUpScreen()
                         
                    ));
            },
  ),
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
                                      const StudentLogin()),
                              (Route route) => false,
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 21, 67, 105),
                        ),
                        child: const Text("YES"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 21, 67, 105),
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
      body: Column(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/graduaioncap.png",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
          depdetails.isEmpty
              ? const Text("No data is available")
              : Expanded(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.03,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: depdetails.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) =>
                          //       Syllabus(teacher: depdetails[index]),
                          // ));
                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 21, 67, 105)),
                          child: Center(
                              child: Text(
                            depdetails[index].department,
                            style: TextStyle(color: Colors.white,fontSize: 20.0),
                            
                          )),
                        ),
                      );
                    },
                  ),
                ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDeparments(),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 21, 67, 105),
        child: Icon(Icons.add),
      ),
    );
  }
}
