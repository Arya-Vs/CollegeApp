import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/navigation.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  File? _selectedImage;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _startingacademicyearController =
      TextEditingController();
  final TextEditingController _endingacademicyearController =
      TextEditingController();
  final TextEditingController _rollnumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _setImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  List<String> departmentList = [];
  String? selectedgender;
  String? selectedDepartment;
  String? selecteddob;

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;
    List<String> years =
        List.generate(20, (index) => (currentYear - index).toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BottomNavWidget(),
            ));
          },
        ),
        title: Text("Demo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 21, 67, 105),
                      maxRadius: 50,
                      child: GestureDetector(
                        onTap: () async {
                          File? pickedImage = await _pickImageFromCamera();
                          if (pickedImage != null) {
                            _setImage(pickedImage);
                          }
                        },
                        child: _selectedImage != null
                            ? ClipOval(
                                child: Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.cover,
                                  width: 140,
                                  height: 140,
                                ),
                              )
                            : const Icon(
                                Icons.add_a_photo_rounded,
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: SizedBox(
                              height: 55,
                              child: TextFormField(
                                controller: _nameController,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    labelText: 'NAME',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'PHONE',
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                              hintStyle: TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your phone number';
                              }
                              if (value.length != 10) {
                                return 'Invalid phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: SizedBox(
                              height: 55,
                              child: DropdownButtonFormField<String>(
                                value: selectedgender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedgender = value!;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select the gender';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'GENDER',
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                  hintText: 'Female',
                                  hintStyle: TextStyle(color: Colors.black26),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: "FEMALE",
                                    child: Text("FEMALE"),
                                  ),
                                  DropdownMenuItem(
                                    value: "MALE",
                                    child: Text("MALE"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          child: DropdownButtonFormField<String>(
                            value: selecteddob,
                            onChanged: (value) {
                              setState(() {
                                selecteddob = value!;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select the DOB';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'D.O.B',
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                              hintText: '2001',
                              hintStyle: TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            items: years.map((year) {
                              return DropdownMenuItem(
                                value: year,
                                child: Text(year),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            width: 20,
                            child: DropdownButtonFormField<String>(
                              value: selectedDepartment,
                              onChanged: (value) {
                                setState(() {
                                  selectedDepartment = value!;
                                  _departmentController.text = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select the department';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "DEPARTMENT",
                                labelStyle: TextStyle(
                                    color: Colors.grey, fontSize: 14.0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 21, 67, 105),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              items: departmentList.map((String department) {
                                return DropdownMenuItem(
                                  value: department,
                                  child: Text(department),
                                );
                              }).toList(),
                            ),
                          ),
                        ),

                   Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(
                      height: 55,
                      child: TextFormField(
                        controller: _startingacademicyearController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'STARTING YEAR',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                          hintText: 'Ed: 2020',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              _showYearPicker(_startYearController as BuildContext);
                            },
                            child: Icon(Icons.calendar_today),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter the starting year';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                 Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(
                      height: 55,
                      child: TextFormField(
                        controller: _endingacademicyearController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'ACADEMIC YEAR',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                          hintText: 'Ed: 2020-2023',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              _showYearPicker(context);
                            },
                            child: Icon(Icons.calendar_today),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your academic year';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<File?> _pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }
    Future<void> _showYearPicker(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate.subtract(Duration(days: 365 * 10)), // 10 years ago
      lastDate: currentDate.add(Duration(days: 365 * 10)), // 10 years in the future
    );
    }
  
}

class _startYearController {
}
