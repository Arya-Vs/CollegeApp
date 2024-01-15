import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newcollege_app/model/student/student_model.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key, required this.students});
  final Student students;
  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 21, 67, 105),
        title:const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(radius: 70,
            backgroundImage: FileImage(File(widget.students.imagePath)),
            ),
            _buildInfoBox("Name", widget.students.name),
            _buildInfoBox("Phone", widget.students.phone),
            _buildInfoBox("Gender", widget.students.gender),
            _buildInfoBox("Date of Birth", widget.students.dob),
            _buildInfoBox("Father's Name", widget.students.fatherName),
            _buildInfoBox("Mother's Name", widget.students.motherName),
            _buildInfoBox("Address", widget.students.address),
            _buildInfoBox("District", widget.students.district),
            _buildInfoBox("Department", widget.students.department),
            _buildInfoBox("Academic Year", widget.students.academicYear),
            _buildInfoBox("Roll Number", widget.students.rollnumber),
            _buildInfoBox("Email", widget.students.email)
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style:const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
