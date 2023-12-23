import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/student/student_model.dart';
import 'package:newcollege_app/screens/adminsreens/studentscreens/student_list.dart';

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

  void _setImage(File image) {
    setState(() {
      _selectedImage = image;
    });
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
        title: const Text("Students Data"),
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
                            child: TextFormField(  
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'NAME',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintText: 'eg: Athish Ts',
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'PHONE',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintText: 'eg: 9947392254',
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _genderController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'GENDER',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintText: 'Female',
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Gender';
                                }

                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: _dobController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'D.O.B',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintText: 'eg: 15/06/2002',
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter D.O.B';
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _fatherController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'FATHER',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintText: 'eg: Sunil v s',
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: _motherController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'MOTHER',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintText: 'Sunitha',
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _addressController,
                        keyboardType: TextInputType.text,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'ADDRESS',
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'eg: Vellakaloor (H)',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter full Address';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Expanded(
                            child: TextFormField(
                              controller: _DistrictController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'DISTRICT',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintText: 'eg: Thrissur',
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),                            
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your District';
                                }

                                return null;
                              },
                            ),
                          ),
                         
                          const SizedBox(width: 20),
                          Expanded(
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
                                      BorderRadius.all(Radius.circular(10)),
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
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _DepartmentController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'DEPARTMENT',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintText: 'eg:  BCA',
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your Department';
                                }

                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
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
                                      BorderRadius.all(Radius.circular(10)),
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
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _TeachernameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'TEACHER NAME',
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'eg: Susha',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter teacher name';
                          }
                         
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: ()async {
                          if (_formKey.currentState!.validate()) {
                            
                            if (_selectedImage != null){
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
                                  imagePath: _selectedImage!.path);
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
                          backgroundColor: const Color.fromARGB(
                              255, 21, 67, 105), 
                        ),
                        child:const Text('Submit'),
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

  
