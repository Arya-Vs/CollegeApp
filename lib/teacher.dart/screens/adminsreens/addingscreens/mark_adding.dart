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
  final TextEditingController semesterController = TextEditingController();
  final TextEditingController subjectoneController = TextEditingController();
  final TextEditingController subjecttwoController = TextEditingController();
  final TextEditingController subjectthreeController = TextEditingController();
  final TextEditingController subjectfourController = TextEditingController();
  final TextEditingController subjectfiveController = TextEditingController();
  final TextEditingController subjectsixController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  List<String> semesters = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6'
  ]; // Add more semesters as needed
  String selectedSemester = 'Semester 1'; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        elevation: 0,
        title: const Text("Marks"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MarkDisplay(),
                ));
              },
              icon: const Icon(Icons.mark_chat_read_sharp))
        ],
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
                  DropdownButtonFormField<String>(
                    value: selectedSemester,
                    onChanged: (value) {
                      setState(() {
                        selectedSemester = value!;
                      });
                    },
                    items: semesters.map((semester) {
                      return DropdownMenuItem(
                        value: semester,
                        child: Text(semester),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Semester',
                     
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 21, 67, 105),),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select the exam Semester';
                      } else {
                        setState(() {
                          selectedSemester = value;
                        });
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: subjectoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 1",
                     
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 21, 67, 105),),
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
                    controller: subjecttwoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 2",
                       
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Color.fromARGB(255, 21, 67, 105),),
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
                    controller: subjectthreeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 3",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 21, 67, 105),),
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
                    controller: subjectfourController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 4",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 21, 67, 105),),
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
                    controller: subjectfiveController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 5",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 21, 67, 105),),
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
                    controller: subjectsixController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Subject 6",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 21, 67, 105),),
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
                    controller: totalController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "TOTAL MARK",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 21, 67, 105),),
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
                          semester: selectedSemester,
                          subject1: subjectoneController.text,
                          subject2: subjecttwoController.text,
                          subject3: subjectthreeController.text,
                          subject4: subjectfourController.text,
                          subject5: subjectfiveController.text,
                          subject6: subjectsixController.text, total: '',
                        );
                        addMarkData(addmarkvalue);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MarkDisplay(),
                        ));
                      }
                    },
                    child: Text("Upload Marks"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 21, 67, 105),
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
