import 'package:flutter/material.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_Profile.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_home.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_navigation/user_mark.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_timetable.dart';

class NavStudents extends StatefulWidget {
  final String stuKey;
  NavStudents({Key? key, required this.stuKey}) : super(key: key);

  @override
  State<NavStudents> createState() => _NavStudentsState();
}

class _NavStudentsState extends State<NavStudents> {
  late List<Widget> items;

  int selectedindex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the items list in initState
    items = [StudentHome(), StudentDetails(stuKey: widget.stuKey), StudentTimetable(), UserMark()];
  }
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
        selectedItemColor: const Color.fromARGB(255, 21, 67, 105),
        unselectedItemColor: Colors.grey,
        items:const<BottomNavigationBarItem> [
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            label: 'Profile',
            backgroundColor: Colors.white
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'TimeTable',
            backgroundColor: Colors.white,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: 'Mark',
            backgroundColor: Colors.white,
          ),
         

        ],
      ),
    );
  }
}