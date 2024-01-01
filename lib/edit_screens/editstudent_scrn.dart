import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/studentscreens/student_list.dart';

class EditScreen extends StatefulWidget {
 
  const EditScreen({super.key, required this.students});
final student students;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  File? _selectedImage;
  final GlobalKey<FormState>_formKey =GlobalKey<FormState>();
  late  TextEditingController _nameController=TextEditingController();
  late TextEditingController _phoneController =TextEditingController();
  late TextEditingController _genderController=TextEditingController();
  late TextEditingController _dobController= TextEditingController();
  late TextEditingController _fatherController=TextEditingController();
  late TextEditingController _motherController=TextEditingController();
  late TextEditingController _addressController=TextEditingController();
  late TextEditingController _DistrictController=TextEditingController();
  late TextEditingController _pincodeController=TextEditingController();
  late TextEditingController _DepartmentController=TextEditingController();
  late TextEditingController _AcademicYearController=TextEditingController();
  late TextEditingController _TeachernameController=TextEditingController();
  late TextEditingController _emailController=TextEditingController();


  String? selectedDepartment;
  String? selectedDistrict;
  String? selectedgender;
  String? selecteddob;

  void _setImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }
  
  Future<void> editStudent(student editStudent, String key) async {
  final box = await Hive.openBox<student>('student_db');
  
  if (editStudent.studentkey == null) {
    await box.put(key, editStudent);
  } else {
    print('Student with key ${editStudent.studentkey} already has a value.');
  }
}

  @override
  void initState() {
setState(() {
  _selectedImage=File(widget.students.imagePath);
  _nameController =  TextEditingController(text: widget.students.name);
  _phoneController =TextEditingController(text: widget.students.phone);
  _genderController =TextEditingController(text: widget.students.gender);
  _dobController =TextEditingController(text: widget.students.dob);
  _fatherController= TextEditingController(text: widget.students.fatherName);
  _motherController =TextEditingController(text: widget.students.motherName);
  _addressController =TextEditingController(text: widget.students.address);
  _DistrictController =TextEditingController(text: widget.students.district);
  _pincodeController =TextEditingController(text: widget.students.pincode);
  _DepartmentController=TextEditingController(text: widget.students.department);
  _AcademicYearController =TextEditingController(text: widget.students.academicYear);
  _TeachernameController=TextEditingController(text: widget.students.teacherName);
});
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Edit Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Form(key: _formKey,
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
                      const SizedBox(
                        height: 30,
                      ),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: 'NAME',
                                    labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
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
                                height: 45,
                                child: TextFormField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType
                                      .emailAddress,
                                  decoration: const InputDecoration(
                                    labelText: 'PHONE',
                                    labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
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
                                  height: 45,
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
                                      labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
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
                           
                            Expanded(
                              child: Container(
                                width: 50,
                                child: Container(
                                  child: SizedBox(
                                    height: 45,
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
                                        labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                                        hintText: '2001',
                                        hintStyle: TextStyle(color: Colors.black26),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(30)),
                                        ),
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: "1999",
                                          child: Text("1999"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2000",
                                          child: Text("2000"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2001",
                                          child: Text("2002"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2002",
                                          child: Text("2002"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2003",
                                          child: Text("2003"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2004",
                                          child: Text("2004"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2005",
                                          child: Text("2005"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2006",
                                          child: Text("2007"),
                                        ),
                                      ],
                                    ),
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
                                height: 45,
                                child: TextFormField(
                                  controller: _fatherController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: ' FATHER NAME',
                                    labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
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
                                height: 45,
                                child: TextFormField(
                                  controller: _motherController,
                                  keyboardType: TextInputType
                                      .emailAddress, 
                                  decoration: const InputDecoration(
                                    labelText: 'MOTHER',
                                    labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
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
                              labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                              hintText: 'eg: Vellakaloor (H)',
                              hintStyle: TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
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
                                  height: 45,
                                  child: DropdownButtonFormField<String>(
                                    value: selectedDistrict,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedDistrict = value!;
                                        _DistrictController.text = value;
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
                                       labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color.fromARGB(255, 21, 67, 105),
                                        ),
                                        borderRadius: BorderRadius.circular(9.0),
                                      ),
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: "KASARAGOD",
                                        child: Text("KASARAGOD"),
                                      ),
                                      DropdownMenuItem(
                                        value: "KANNUR",
                                        child: Text("KANNUR"),
                                      ),
                                      DropdownMenuItem(
                                        value: "WAYANAD",
                                        child: Text("WAYANAD"),
                                      ),
                                      DropdownMenuItem(
                                        value: " KOZHIKODE",
                                        child: Text(" KOZHIKODE"),
                                      ),
                                      DropdownMenuItem(
                                        value: " MALAPPURAM",
                                        child: Text(" MALAPPURAM"),
                                      ),
                                      DropdownMenuItem(
                                        value: " PALAKKAD",
                                        child: Text(" PALAKKAD"),
                                      ),
                                      DropdownMenuItem(
                                        value: " THRISSUR",
                                        child: Text(" THRISSUR"),
                                      ),
                                      DropdownMenuItem(
                                        value: " ERNAKULAM",
                                        child: Text(" ERNAKULAM"),
                                      ),
                                      DropdownMenuItem(
                                        value: " IDUKKI",
                                        child: Text(" IDUKKI"),
                                      ),
                                      DropdownMenuItem(
                                        value: " KOTTAYAM",
                                        child: Text(" KOTTAYAM"),
                                      ),
                                      DropdownMenuItem(
                                        value: " ALAPPUZHA",
                                        child: Text(" ALAPPUZHA"),
                                      ),
                                      DropdownMenuItem(
                                        value: " PATHANAMTHITTA",
                                        child: Text(" PATHANAMTHITTA"),
                                      ),
                                      DropdownMenuItem(
                                        value: " KOLLAM",
                                        child: Text(" KOLLAM"),
                                      ),
                                      DropdownMenuItem(
                                        value: " THIRUVANANTHAPURAM",
                                        child: Text(" THIRUVANANTHAPURAM"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  height: 45,
                                  width: 20,
                                  child: TextFormField(
                                    controller: _pincodeController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'PINCODE',
                                      labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                                      hintText: '(6799923)',
                                      hintStyle: TextStyle(color: Colors.black26),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Pincode';
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
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child: SizedBox(
                                  height: 45,
                                  width: 20,
                                  child: DropdownButtonFormField<String>(
                                    value: selectedDepartment,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedDepartment = value!;
                                        _DepartmentController.text = value;
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
                            labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),                                       floatingLabelBehavior:
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
                                    items: const [
                                      DropdownMenuItem(
                                        value: "BCA",
                                        child: Text("BCA"),
                                      ),
                                      DropdownMenuItem(
                                        value: "B.Com",
                                        child: Text("B.com"),
                                      ),
                                      DropdownMenuItem(
                                        value: "BBA",
                                        child: Text("BBA"),
                                      ),
                                      DropdownMenuItem(
                                        value: "B.Com CA",
                                        child: Text("B.Com CA"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    controller: _AcademicYearController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'ACADEMIC YEAR',
                                      labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                                      hintText: 'Ed: 2020-2023',
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
                                height: 45,
                                child: TextFormField(
                                  controller: _TeachernameController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: 'TEACHER NAME',
                                    labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                                    hintText: 'eg: Susha',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter teacher name';
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
                                height: 45,
                                child: TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType
                                      .emailAddress, // Assuming it's an email input
                                  decoration: const InputDecoration(
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                                    hintText: 'eg: example@gmail.com',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_selectedImage != null) {
                              final students = student(
                                name: _nameController.text,
                                phone: _phoneController.text,
                                gender: _genderController.text,
                                dob: _dobController.text,
                                fatherName: _fatherController.text,
                                motherName: _motherController.text,
                                address: _addressController.text,
                                district: _DistrictController.text,
                                pincode: _pincodeController.text,
                                department: _DepartmentController.text,
                                academicYear: _AcademicYearController.text,
                                teacherName: _TeachernameController.text,
                                email: _emailController.text,
                                imagePath: _selectedImage!.path,
                              );

      
                              await addStudentData(students);
                              print(students);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StudentList(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 21, 67, 105),
                        ),
                        child: const Text('Edit'),
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
