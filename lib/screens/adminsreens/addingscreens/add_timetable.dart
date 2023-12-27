import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/timetable/timetable_model.dart';
import 'package:newcollege_app/teacher.dart/timetable_display.dart';

import 'package:newcollege_app/widgets/text_feilds.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

final _formKey = GlobalKey<FormState>();
final dateController = TextEditingController();
final timeController = TextEditingController();
final subjectController = TextEditingController();

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam Time Table"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search), 
            onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext ctx) =>TimeView()
                         
                    ));
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
                    TextFormFieldWidget(
                        controller: subjectController,
                        labeltext: "Subject",
                        errorText: "Enter the exam Sub",
                        keyboardType: TextInputType.text, height: 10,),
                    TextFormFieldWidget(
                        controller: timeController,
                        labeltext: "Date",
                        errorText: "Enter the exam Time",
                        keyboardType: TextInputType.number, height: 10,),
                    TextFormFieldWidget(
                        controller: dateController,
                        labeltext: "Time",
                        errorText: "Enter the exam Date",
                        keyboardType: TextInputType.number, height: 10,),
                         
                    const SizedBox(
                      height: 50.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final addtimevalue = TimeTableModel(
                            subject: subjectController.text,
                            date: dateController.text,
                            time: timeController.text,
                          
                          );
                          addTimeTable(addtimevalue);
                    
                          dateController.clear();
                          timeController.clear();
                          subjectController.clear();
                       
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimeView(),));
                        }
                      },
                       style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 21, 67, 105) , // Set the button background color
                          onPrimary: Colors.white, // Set the text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Set border radius
                          ),
                          padding: EdgeInsets.all(15.0), // Set padding
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
