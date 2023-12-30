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
      appBar: AppBar(
        title: const Text("Exam Time Table"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentHome(),));
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: timetabledetailes.length,
        itemBuilder: (BuildContext context, int index) {
          TimeTableModel timetable = timetabledetailes[index];
          return Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.only(left: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          timetable.subject,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Date:   ${timetable.date}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Text(
                        'Time:  \n${timetable.time}',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}