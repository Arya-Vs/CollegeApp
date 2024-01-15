import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/department/teacher_add.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/navigation.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/studentscreens/student_list.dart';

class AddScreen extends StatefulWidget {
  final String? selectedDepartment;
  final String ?selectedDepartmentKey;
  final Teacher? department;
  const AddScreen({Key? key, this.selectedDepartment,  this.department, this.selectedDepartmentKey}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  File? _selectedImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _motherController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _academicYearController = TextEditingController();
  final TextEditingController _rollnumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<String> districtList = [
    "KASARAGOD",
    "KANNUR",
    "WAYANAD",
    "KOZHIKODE",
    "MALAPPURAM",
    "PALAKKAD",
    "THRISSUR",
    "ERNAKULAM",
    "IDUKKI",
    "KOTTAYAM",
    "ALAPPUZHA",
    "PATHANAMTHITTA",
    "KOLLAM",
    "THIRUVANANTHAPURAM",
  ];

  List<String> departmentList = [];
  String? selectedDepartment;
  String? selectedDistrict;
  String? selectedgender;
  String? selecteddob;

  void _setImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  Future<void> loadDepartments() async {
    var box = await Hive.openBox<Teacher>('teacher_db');
    List<String> list = [];

    final List<Teacher> teacherList = box.values.toList();

    for (int i = 0; i < teacherList.length; i++) {
      list.add(teacherList[i].department);
    }

    setState(() {
      departmentList = list;
    });
  }

  @override
  void initState() {
    loadDepartments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keyy = widget.selectedDepartmentKey;
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
        title: const Text(" Add Student"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 55,
                                child: TextFormField(
                                  controller: _nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: 'NAME',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 14.0),
                                    hintText: 'eg:Arya ',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
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
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 55,
                                child: TextFormField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'PHONE',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 14.0),
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
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                      hintStyle:
                                          TextStyle(color: Colors.black26),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
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
                            Expanded(
                              child: SizedBox(
                                width: 50,
                                child: SizedBox(
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
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 14.0),
                                      hintText: '2001',
                                      hintStyle:
                                          TextStyle(color: Colors.black26),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 55,
                                child: TextFormField(
                                  controller: _fatherController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: ' FATHER NAME',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 14.0),
                                    hintText: 'eg: Sunil ',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your Father Name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 55,
                                child: TextFormField(
                                  controller: _motherController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    labelText: 'MOTHER',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 14.0),
                                    hintText: 'eg: Sunitha',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your Mother Name';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: _addressController,
                            keyboardType: TextInputType.text,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'ADDRESS',
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                              hintText: 'eg: Vellakaloor (H)',
                              hintStyle: TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(70)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter full Address';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: SizedBox(
                                  height: 55,
                                  child: DropdownButtonFormField<String>(
                                    value: selectedDistrict,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedDistrict = value!;
                                        _districtController.text = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select the district';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "DISTRICT",
                                      labelStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 14.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 21, 67, 105),
                                        ),
                                        borderRadius: BorderRadius.circular(70),
                                      ),
                                    ),
                                    items: buildDropdownItems(districtList),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
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
                                  items:
                                      departmentList.map((String department) {
                                    return DropdownMenuItem(
                                      value: department,
                                      child: Text(department),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  height: 55,
                                  child: TextFormField(
                                    controller: _academicYearController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'ACADEMIC YEAR',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 14.0),
                                      hintText: 'Ed: 2020-2023',
                                      hintStyle:
                                          TextStyle(color: Colors.black26),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
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
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 55,
                                child: TextFormField(
                                  controller: _rollnumberController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: '  ROLL NUMBER',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 14.0),
                                    hintText: 'eg: 10',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
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
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 55,
                                child: TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType
                                      .emailAddress, // Assuming it's an email input
                                  decoration: const InputDecoration(
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 14.0),
                                    hintText: 'eg: example@gmail.com',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your email';
                                    }
                                    if (!value.endsWith('@gmail.com')) {
                                      return 'Invalid email format. Please enter a Gmail address.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async { print('the key for saving is$keyy');
                          if (_formKey.currentState!.validate()) {
                            if (_selectedImage != null) {
                              final students = Student(departmentKey: widget.selectedDepartmentKey,
                                name: _nameController.text,
                                phone: _phoneController.text,
                                gender: _genderController.text,
                                dob: _dobController.text,
                                fatherName: _fatherController.text,
                                motherName: _motherController.text,
                                address: _addressController.text,
                                district: _districtController.text,
                                department: _departmentController.text,
                                academicYear: _academicYearController.text,
                                rollnumber: _rollnumberController.text,
                                email: _emailController.text,
                                imagePath: _selectedImage!.path,
                              );
                              await addStudentData(students);
                              _nameController.clear();
                              _phoneController.clear();
                              _genderController.clear();
                              _dobController.clear();
                              _fatherController.clear();
                              _motherController.clear();
                              _addressController.clear();
                              _districtController.clear();
                              _departmentController.clear();
                              _academicYearController.clear();
                              _rollnumberController.clear();

                              print(students);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  StudentList(departmentKey:widget.department?.departementKey),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 21, 67, 105),
                        ),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<File?> _pickImageFromCamera() async {
  final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    return File(pickedImage.path);
  }
  return null;
}

List<DropdownMenuItem<String>> buildDropdownItems(List<String> items) {
  return items.map((value) {
    return DropdownMenuItem(
      value: value,
      child: Text(value),
    );
  }).toList();
}
