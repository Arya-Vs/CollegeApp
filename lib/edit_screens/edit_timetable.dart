import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newcollege_app/model/timetable/timetable_model.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/studentscreens/timetable_display.dart';


class EditTimeTable extends StatefulWidget {
  TimeTableModel timeTable;
   EditTimeTable({super.key,required this.timeTable});

  @override
  State<EditTimeTable> createState() => _EditTimeTableState();
}
class _EditTimeTableState extends State<EditTimeTable> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late TextEditingController timeController;
  late TextEditingController subjectController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController(text: widget.timeTable.date);
    timeController = TextEditingController(text: widget.timeTable.time);
    subjectController = TextEditingController(text: widget.timeTable.subject);
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

 
  Future<void> editTime(TimeTableModel updatedValues) async {
    final box = await Hive.openBox<TimeTableModel>('timetable_db');
    if (box.containsKey(updatedValues.timetablekey)) {
      await box.put(updatedValues.timetablekey!, updatedValues);
    } else {
      print('Timetable with key ${updatedValues.timetablekey} not found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Time"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 21, 67, 105),
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
              padding: EdgeInsets.only(left: 20),
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
                    SizedBox(
                      height: 50.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final updatedValues = TimeTableModel(
                            date: dateController.text,
                            time: timeController.text,
                            subject: subjectController.text,
                            timetablekey: widget.timeTable.timetablekey,
                          );

                          editTime(updatedValues);
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
                        backgroundColor: Color.fromARGB(255, 21, 67, 105),
                        // onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.all(15.0),
                      ),
                      child: Text("Edit"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}