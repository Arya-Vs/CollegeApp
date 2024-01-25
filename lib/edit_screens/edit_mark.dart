import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/studentscreens/mark_display.dart';

class EditMarks extends StatefulWidget {
  Markmodel studetmarks;
  EditMarks({super.key, required this.studetmarks});

  @override
  State<EditMarks> createState() => _EditMarksState();
}

class _EditMarksState extends State<EditMarks> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController subjectoneController = TextEditingController();
  final TextEditingController subjecttwoController = TextEditingController();
  final TextEditingController subjectthreeController = TextEditingController();
  final TextEditingController subjectfourController = TextEditingController();
  final TextEditingController subjectfiveController = TextEditingController();
  final TextEditingController subjectsixController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    subjectoneController.text = widget.studetmarks.subject1;
    subjecttwoController.text = widget.studetmarks.subject2;
    subjectthreeController.text = widget.studetmarks.subject3;
    subjectfourController.text = widget.studetmarks.subject4;
    subjectfiveController.text = widget.studetmarks.subject5;
    subjectsixController.text = widget.studetmarks.subject6;
    totalController.text = widget.studetmarks.total;
  }

  Future<void> editmark(Markmodel updatedValues) async {
    final box = await Hive.openBox<Markmodel>('mark_db');

    if (updatedValues.markkey != null) {
      if (box.containsKey(updatedValues.markkey!)) {
        box.put(updatedValues.markkey!, updatedValues);
        print('Marks updated successfully.');
      } else {
        print('No marks found with the given key.');
      }
    } else {
      print('Mark key is null. Cannot perform the edit operation.');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Marks"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 21, 67, 105),
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      value: widget.studetmarks.semester,
                      onChanged: (value) {
                        setState(() {
                          widget.studetmarks.semester = value!;
                        });
                      },
                      items: [
                        'Semester 1',
                        'Semester 2',
                        'Semester 3',
                        'Semester 4',
                        'Semester 5',
                        'Semester 6'
                      ]
                          .map((semester) => DropdownMenuItem(
                                value: semester,
                                child: Text(semester),
                              ))
                          .toList(),
                      decoration: const InputDecoration(
                        labelText: 'Semester',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 21, 67, 105)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select the exam Semester';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormFieldWidget(
                      controller: subjectoneController,
                      labelText: 'Subject 1',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Subject 1 marks';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      controller: subjecttwoController,
                      labelText: 'Subject 2',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Subject 2 marks';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      controller: subjectthreeController,
                      labelText: 'Subject 3',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Subject 3 marks';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      controller: subjectfourController,
                      labelText: 'Subject 4',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Subject 4 marks';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      controller: subjectfiveController,
                      labelText: 'Subject 5',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Subject 5 marks';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      controller: subjectsixController,
                      labelText: 'Subject 6',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Subject 6 marks';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      controller: totalController,
                      labelText: 'Total',
                    ),
                    const SizedBox(
                      height: 70,
                      width: 150,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final markupdatedValues = Markmodel(
                            semester: widget.studetmarks.semester,
                            subject1: subjectoneController.text,
                            subject2: subjecttwoController.text,
                            subject3: subjectthreeController.text,
                            subject4: subjectfourController.text,
                            subject5: subjectfiveController.text,
                            subject6: subjectsixController.text,
                            total: totalController.text,
                            studentId: widget.studetmarks.markkey

                          );
                          editmark(markupdatedValues);
                          subjectoneController.clear();
                          subjecttwoController.clear();
                          subjectthreeController.clear();
                          subjectfourController.clear();
                          subjectfiveController.clear();
                          subjectsixController.clear();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MarkDisplay(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fix the errors.'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      
                      child: const Text('Edit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 21, 67, 105)),
        ),
      ),
      validator: validator,
    );
  }
}
