
import 'package:flutter/material.dart';
import 'package:newcollege_app/screens/home_screen.dart';
import 'package:newcollege_app/teacher.dart/add_student.dart';
import 'package:newcollege_app/teacher.dart/student_list.dart';
import 'package:newcollege_app/teacher.dart/timetable.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
   final List<Widget>items =[HomeScreen(),StudentList(),AddScreen(),TimeTable()];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

  body: items[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap:(value) {
          setState(() {
            selectedindex=value;
          });
        },
        showUnselectedLabels: true,
        selectedItemColor: Color.fromARGB(255, 21, 67, 105),
        unselectedItemColor: Colors.grey,
        items:const<BottomNavigationBarItem> [
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            label: 'Add Student',
            backgroundColor: Colors.white,
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'TimeTable',
            backgroundColor: Colors.white,
          ),
         

        ],
      ),
    );
  }
}