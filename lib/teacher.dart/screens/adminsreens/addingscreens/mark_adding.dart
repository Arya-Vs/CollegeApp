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
  final TextEditingController totalController = TextEditingController();
  List<String> semesters = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6'
  ];
  String selectedSemester = 'Semester 1';

  final Map<String, TextEditingController> subjectControllers = {
    'Subject 1': TextEditingController(),
    'Subject 2': TextEditingController(),
    'Subject 3': TextEditingController(),
    'Subject 4': TextEditingController(),
    'Subject 5': TextEditingController(),
    'Subject 6': TextEditingController(),
  };

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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MarkDisplay(),
                ),
              );
            },
            icon: const Icon(Icons.mark_chat_read_sharp),
          )
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
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 21, 67, 105),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select the exam Semester';
                      }
                      return null;
                    },
                  ),
                  ...subjectControllers.entries.map(
                    (entry) => TextFormField(
                      controller: entry.value,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: entry.key,
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 21, 67, 105),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the exam ${entry.key.toLowerCase()}';
                        }
                        return null;
                      },
                    ),
                  ),
                  TextFormField(
                    controller: totalController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "TOTAL MARK",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 21, 67, 105),
                        ),
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
                        final addMarkValue = Markmodel(
                          studentId: widget.student.studentkey,
                          semester: selectedSemester,
                          subject1: subjectControllers['Subject 1']!.text,
                          subject2: subjectControllers['Subject 2']!.text,
                          subject3: subjectControllers['Subject 3']!.text,
                          subject4: subjectControllers['Subject 4']!.text,
                          subject5: subjectControllers['Subject 5']!.text,
                          subject6: subjectControllers['Subject 6']!.text,
                          total: totalController.text,
                        );
                        addMarkData(addMarkValue);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MarkDisplay(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 21, 67, 105),
                    ),
                    child: const Text("Upload Marks"),
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