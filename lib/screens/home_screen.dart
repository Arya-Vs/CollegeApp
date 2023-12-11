import 'dart:developer';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newcollege_app/model/student_model.dart';
import 'package:newcollege_app/screens/login_screen.dart';
import 'package:newcollege_app/teacher.dart/add_student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController academicController = TextEditingController();
  TextEditingController teacherController = TextEditingController();
  String? selectedDepartment;
  String? _errorText;
  int currentIndex = 0; 
 late List<student>  studentdetails;
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    log('in home screen init');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 21, 67, 105),
        title: const Text('ADD NEW'),
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
                        
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 21, 67, 105),
                        ),
                        child: const Text("YES",
                       ),
                      ),
                      ElevatedButton(
                        
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                         style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 21, 67, 105),
                        ),
                        child: const Text("NO",
                        ),
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
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/graduaioncap.png",
                  // 'assets/images/graduaioncap.png'
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: 300.0,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedDepartment,
                        onChanged: (value) {
                          setState(() {
                            selectedDepartment = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select the department';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "DEPARTMENT",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color:Color.fromARGB(255, 21, 67, 105),),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: "BCA",
                            child: Text("BCA"),
                          ),
                          DropdownMenuItem(
                            value: "B.Com",
                            child: Text("B.com"),
                          ),
                          DropdownMenuItem(
                            value: "BBA",
                            child: Text("BBA"),
                          ),
                          DropdownMenuItem(
                            value: "B.Com CA",
                            child: Text("B.Com CA"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      TextFormField(
                        controller: academicController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the academic year';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "ACADEMIC YEAR",
                          hintText: "Eg:2020 - 2023",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 21, 67, 105),),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      TextFormField(
                        controller: teacherController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the teacher name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "TEACHER NAME",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color:Color.fromARGB(255, 21, 67, 105),),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Container(
                        height: 80.0,
                        width: 120.0,
                        child: IconButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                       

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddScreen()
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 45.0,
                          ),
                        ),
                      ),
                      if (_errorText != null)
                        Text(
                          _errorText!,
                          style:const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:  Color.fromARGB(255, 21, 67, 105),
        color: Colors.white,
        buttonBackgroundColor:  Color.fromARGB(255, 21, 67, 105),
        height: 50,
        items: const [
          Icon(Icons.home,
              size: 30, color: Color.fromARGB(255, 15, 15, 15)),
          Icon(Icons.search, size: 30),
          Icon(Icons.message_outlined, size: 30),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}