import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/department/teacher_add.dart';
import 'package:newcollege_app/teacher.dart/screens/adminsreens/admin_homescreen.dart';
import 'package:newcollege_app/widgets/text_feilds.dart';

class EditDepartment extends StatefulWidget {
  Teacher department;
  EditDepartment({super.key, required this.department});

  @override
  State<EditDepartment> createState() =>_EditDepartmentState();
}

class _EditDepartmentState extends State<EditDepartment> {
  @override
  void initState() {
    super.initState();
    print(widget.department.department);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final TextEditingController _nameController =TextEditingController(text: widget.department.department);
    final departmentController = TextEditingController(text: widget.department.department);
    final sem1Controller = TextEditingController(text:widget.department.sem1);
    final sem2Controller = TextEditingController(text: widget.department.sem2);
    final sem3Controller = TextEditingController(text: widget.department.sem3);
    final sem4Controller = TextEditingController(text: widget.department.sem4);
    final sem5Controller = TextEditingController(text: widget.department.sem5);
    final sem6Controller = TextEditingController(text: widget.department.sem6);

    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        centerTitle: true,
        title:const Text("Departments"),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller: departmentController,
                      errorText: "Enter the department name",
                      keyboardType: TextInputType.text,
                      labeltext: "Department", height: 100,
                    ),
                    TextFormFieldWidget(
                      controller: sem1Controller,
                      errorText: "Enter the Semester 1 Details",
                      keyboardType: TextInputType.text,
                      labeltext: "Semester 1", height: 50,
                    ),
                    TextFormFieldWidget(
                      controller: sem2Controller,
                      errorText: "Enter the Semester 2 Details",
                      keyboardType: TextInputType.text,
                      labeltext: "Semester 2", height: 50,
                    ),
                    TextFormFieldWidget(
                      controller: sem3Controller,
                      errorText: "Enter the Semester 3 Details",
                      keyboardType: TextInputType.text,
                      labeltext: "Semester 3", height: 50,
                    ),
                    TextFormFieldWidget(
                      controller: sem4Controller,
                      errorText: "Enter the semester 4 Details",
                      keyboardType: TextInputType.text,
                      labeltext: "Semester 4", height: 50,
                    ),
                    TextFormFieldWidget(
                      controller: sem5Controller,
                      errorText: "Enter the semester 5 Details",
                      keyboardType: TextInputType.text,
                      labeltext: "Semester 5", height: 70,
                    ),
                    TextFormFieldWidget(
                      controller: sem6Controller,
                      errorText: "Enter the semester 6 Details",
                      keyboardType: TextInputType.text,
                      labeltext: "Semester 6", height: 700,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          final adddepartments = Teacher(
                            department: departmentController.text,
                            sem1: sem1Controller.text,
                            sem2: sem2Controller.text,
                            sem3: sem3Controller.text,
                            sem4: sem4Controller.text,
                            sem5: sem5Controller.text,
                            sem6: sem6Controller.text,
                          );

                          await addDepartment(adddepartments);
                          departmentController.clear();
                          sem1Controller.clear();
                          sem2Controller.clear();
                          sem3Controller.clear();
                          sem4Controller.clear();
                          sem5Controller.clear();
                          sem6Controller.clear();

                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 21, 67, 105),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                      ),
                      child: const Text("Edit"),
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
}
