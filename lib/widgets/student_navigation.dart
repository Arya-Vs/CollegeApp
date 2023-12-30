import 'package:flutter/material.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_home.dart';


class StudentNavigation extends StatefulWidget {
  const StudentNavigation({Key? key}) : super(key: key);

  @override
  State<StudentNavigation> createState() => _StudentNavigationState();
}

class _StudentNavigationState extends State<StudentNavigation> {
  final List<Widget> items = [ const StudentHome(),];
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        showUnselectedLabels: true,
        selectedItemColor: const Color.fromARGB(255, 21, 67, 105),
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 190, 49, 49),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Color.fromARGB(255, 167, 18, 18),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            label: 'Add Student',
            backgroundColor: Color.fromARGB(255, 231, 77, 77),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'TimeTable',
            backgroundColor: Color.fromARGB(255, 231, 42, 42),
          ),
        ],
      ),
    );
  }
}
