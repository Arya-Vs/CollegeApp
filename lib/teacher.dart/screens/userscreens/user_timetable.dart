import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/timetable/timetable_model.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_home.dart';

class StudentTimetable extends StatefulWidget {
  const StudentTimetable({super.key});

  @override
  State<StudentTimetable> createState() => _StudentTimetableState();
}
class _StudentTimetableState extends State<StudentTimetable> {
  List<TimeTableModel> timetabledetailes = [];

  Future<void> fetchtimetabledetails() async {
    List<TimeTableModel> timetabledetaile = await getAllTimetable();
    setState(() {
      timetabledetailes = timetabledetaile;
    });
  }

  @override
  void initState() {
    fetchtimetabledetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 67, 105),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Exam Time Table"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 21, 67, 105),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StudentHome()),
                );
              },
            ),
            pinned: true,
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                TimeTableModel timetable = timetabledetailes[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            timetable.subject,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            'Date: ${timetable.date}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            'Time: ${timetable.time}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: timetabledetailes.length,
            ),
          ),
        ],
      ),
    );
  }
}