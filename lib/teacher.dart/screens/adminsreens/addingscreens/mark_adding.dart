import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/studentscreens/mark_display.dart';

class MarkView extends StatefulWidget {
   MarkView({super.key,required this.student,});
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
        color:  Color.fromARGB(255, 21, 67, 105),
        height: 800,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _semesterController,
                  keyboardType: TextInputType.number,
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
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _subjectoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Subject 1",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the exam subject1';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
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
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _subjectthreeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Subject",
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
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _subjectfourController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Subject",
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
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _subjectfiveController,
                  decoration: const InputDecoration(
                    labelText: "Subject",
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
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _subjectsixController,
                  decoration: const InputDecoration(
                    labelText: "Subject",
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
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _totalController,
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
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final addmarkvalue = Markmodel(studentId: widget.student.studentkey,
                        semester: _semesterController.text,
                        subject1: _subjectoneController.text,
                        subject2: _subjecttwoController.text,
                        subject3: _subjectthreeController.text,
                        subject4: _subjectfourController.text,
                        subject5: _subjectfiveController.text,
                        subject6: _subjectsixController.text, // Update this field
                      );
                      addMarkData(addmarkvalue);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  const MarkDisplay(),
                      ));
                    }
                  },
                  child: const Text("Upload Marks"))
            ],
          ),
        ),
      ),
    );
  }
}

















        // child: Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(left: 20),
        //       child: Form(
        //         child: Column(
        //         children: [
        //           TextFormField(
        //             controller: _semesterController,
        //             keyboardType: TextInputType.number,
        //             decoration: const InputDecoration(
        //               labelText: "Semester",
        //               focusedBorder: UnderlineInputBorder(
        //                 borderSide: BorderSide(color: Colors.blue),
        //               ),
        //             ),
        //             validator: (value) {
        //               if (value == null || value.isEmpty) {
        //                 return 'Please enter the exam Semester';
        //               }
        //               return null;
        //             },
        //           ),
        //           TextFormField(
        //             controller: _subjectoneController,
        //             keyboardType: TextInputType.number,
        //             decoration: const InputDecoration(
        //               labelText: "Subject 1",
        //               focusedBorder: UnderlineInputBorder(
        //                 borderSide: BorderSide(color: Colors.blue),
        //               ),
        //             ),
        //             validator: (value) {
        //               if (value == null || value.isEmpty) {
        //                 return 'Please enter the exam subject1';
        //               }
        //               return null;
        //             },
        //           ),

 
        //         ],
        //       )),
        //     ),
        //   ],
        // ),