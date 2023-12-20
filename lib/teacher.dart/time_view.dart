import 'package:flutter/material.dart';
import 'package:newcollege_app/model/hive_function.dart';
import 'package:newcollege_app/model/timetable_model.dart';

class TimeView extends StatefulWidget {
  const TimeView({Key? key}) : super(key: key);

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
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
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Time Table"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: timetabledetailes.map((timetable) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(timetable.subject),
                        Text(timetable.date),
                        Text(timetable.time),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
