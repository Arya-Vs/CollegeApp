import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/timetable/timetable_model.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/studentscreens/timetable_display.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

final _formKey = GlobalKey<FormState>();
final dateController = TextEditingController();
final timeController = TextEditingController();
final subjectController = TextEditingController();
final departmentController = TextFormField();

class _TimeTableState extends State<TimeTable> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam Time Table"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.timer),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext ctx) => const TimeView(),
                ),
              );
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: subjectController,
                      decoration: const InputDecoration(
                        labelText: "Subject",
                        prefixIcon: Icon(Icons.subject),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the exam subject';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: timeController,
                      decoration: const InputDecoration(
                        labelText: "Time",
                        prefixIcon: Icon(Icons.lock_clock),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onTap: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (timeOfDay != null) {
                          setState(() {
                            selectedTime = timeOfDay;
                            timeController.text =
                                "${timeOfDay.hour}:${timeOfDay.minute}";
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the exam time';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        labelText: "Date",
                        prefixIcon: Icon(Icons.calendar_today),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 2, 65, 116)),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                            dateController.text =
                                "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the exam date';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final addTimeValue = TimeTableModel(
                            subject: subjectController.text,
                            date: dateController.text,
                            time: timeController.text,
                          );
                          addTimeTable(addTimeValue);

                          dateController.clear();
                          timeController.clear();
                          subjectController.clear();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TimeView(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 21, 67, 105),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.all(15.0),
                      ),
                      child: const Text("Upload Timetable"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
