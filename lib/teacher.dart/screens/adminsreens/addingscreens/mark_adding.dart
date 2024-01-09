import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/studentscreens/mark_display.dart';

class MarkView extends StatefulWidget {
  MarkView({
    super.key,
    required this.student,
  });
  final Student student;
  @override
  State<MarkView> createState() => _MarkViewState();
}

class _MarkViewState extends State<MarkView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _subjectoneController = TextEditingController();
  final TextEditingController _subjecttwoController = TextEditingController();
  final TextEditingController _subjectthreeController = TextEditingController();
  final TextEditingController _subjectfourController = TextEditingController();
  final TextEditingController _subjectfiveController = TextEditingController();
  final TextEditingController _subjectsixController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        elevation: 0,
        title: const Text("Marks"),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 21, 67, 105),
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Card(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextFormField(
                    controller: _semesterController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Semester",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the exam Semester';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _subjectoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 1",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the exam subject1';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _subjecttwoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 2",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the exam subject2';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _subjectthreeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 3",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the exam subject3';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _subjectfourController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 4",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the exam subject4';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _subjectfiveController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 5",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the exam subject5';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _subjectsixController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 6",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the exam subject6';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _totalController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "TOTAL MARK",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the exam Total marks';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 70,
                    width: 90,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final addmarkvalue = Markmodel(
                          studentId: widget.student.studentkey,
                          semester: _semesterController.text,
                          subject1: _subjectoneController.text,
                          subject2: _subjecttwoController.text,
                          subject3: _subjectthreeController.text,
                          subject4: _subjectfourController.text,
                          subject5: _subjectfiveController.text,
                          subject6: _subjectsixController.text,
                        );
                        addMarkData(addmarkvalue);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MarkDisplay(),
                        ));
                      }
                    },
                    child:   Text("Upload Marks"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 21, 67, 105), 
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
