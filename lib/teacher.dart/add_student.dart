import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newcollege_app/model/hive_function.dart';
import 'package:newcollege_app/model/student_model.dart';
import 'package:newcollege_app/teacher.dart/student_list.dart';


class AddScreen extends StatefulWidget {
    final String? selectedDepartment;
  const AddScreen({Key? key, this.selectedDepartment}) : super(key: key);

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
  final TextEditingController _DistrictController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _DepartmentController = TextEditingController();
  final TextEditingController _AcademicYearController = TextEditingController();
  final TextEditingController _TeachernameController = TextEditingController();

String? selectedDepartment;
String? selectedDistrict ;
String? selectedgender;
String? selecteddob;

  void _setImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title:  Text(" Add Student"),
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
                        backgroundColor:  const Color.fromARGB(255, 21, 67, 105),
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
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        
                        child: TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'NAME',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'eg: Athish Ts',
                            hintStyle: TextStyle(color: Colors.black26),
                             border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Name';
                            }
                            if (value.length < 4) {
                              return 'Name is too short';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'PHONE',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'eg: 9947392254',
                            hintStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter phone number';
                            }
                            if (value.length != 10) {
                              return 'Invalid phone number';
                            }
                            return null;
                          },
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
                                width: 50,
                                child: DropdownButtonFormField<String>(
                                  value: selectedgender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedgender=value!;
                                    });
                                  },
                                  validator:(value) {
                                    if (value == null || value.isEmpty) {
                                       return 'Please select the gender';
                                    }
                                    return null;
                                  },
                                
                                  decoration: const InputDecoration(
                                    labelText: 'GENDER',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    hintText: 'Female',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                                items:const [
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
                            ///////////////////// 2  /////////////////////
                            ///
                              Expanded(
                              child: Container(
                                width: 50,
                                child: DropdownButtonFormField<String>(
                                  value: selecteddob,
                                  onChanged: (value) {
                                    setState(() {
                                      selecteddob=value!;
                                    });
                                  },
                                  validator:(value) {
                                    if (value == null || value.isEmpty) {
                                       return 'Please select the DOB';
                                    }
                                    return null;
                                  },
                                
                                  decoration: const InputDecoration(
                                    labelText: 'D.O.B',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    hintText: '2001',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                                items:const [
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
                          ],
                        ),
                      ),
                     
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: _fatherController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'FATHER',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'eg: Sunil v s',
                            hintStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your father name';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: _motherController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'MOTHER',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'Sunitha',
                            hintStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your mother name';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _addressController,
                            keyboardType: TextInputType.text,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'ADDRESS',
                              labelStyle: TextStyle(color: Colors.grey),
                              hintText: 'eg: Vellakaloor (H)',
                              hintStyle: TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Expanded(
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
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextFormField(
                                controller: _pincodeController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'PINCODE',
                                  labelStyle: TextStyle(color: Colors.grey),
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
                                  }                                return null;
                                },
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
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: TextFormField(
                                  controller: _AcademicYearController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'ACADEMIC YEAR',
                                    labelStyle: TextStyle(color: Colors.grey),
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
                                    }                                return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: _TeachernameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'TEACHER NAME',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'eg: Susha',
                            hintStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
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
  }}

      Future<File?> _pickImageFromCamera() async {
        final pickedImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          return File(pickedImage.path);
        }
        return null;
        }
