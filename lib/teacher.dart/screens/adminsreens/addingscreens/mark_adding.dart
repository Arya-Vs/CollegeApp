import 'package:flutter/material.dart';

class MarkView extends StatefulWidget {
  const MarkView({Key? key});

  @override
  State<MarkView> createState() => _MarkViewState();
}

class _MarkViewState extends State<MarkView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      backgroundColor: Color.fromARGB(255, 21, 67, 105),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 21, 67, 105),
        elevation: 0,
        title: Text("Marks"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            buildCard(height: 700, text: 'Semester 1'),
            buildCard(height: 700, text: 'Semester 2'),
            buildCard(height: 700, text: 'Semester 3'),
            buildCard(height: 700, text: 'Semester 4'),
            buildCard(height: 700, text: 'Semester 5'),
            buildCard(height: 700, text: 'Semester 6'),
            
          ],
        ),
      ),
    );
  }
  Widget buildCard({required double height, required String text}) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _subjectoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject 1 marks';
                  }
                  // Add any additional validation logic here
                  return null;
                },
                decoration: InputDecoration(labelText: 'Subject 1'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _subjecttwoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject 2 marks';
                  }
                  // Add any additional validation logic here
                  return null;
                },
                decoration: InputDecoration(labelText: 'Subject 2'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _subjectthreeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject 3 marks';
                  }
                  // Add any additional validation logic here
                  return null;
                },
                decoration: InputDecoration(labelText: 'Subject 3'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _subjectfourController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject 4 marks';
                  }
                  // Add any additional validation logic here
                  return null;
                },
                decoration: InputDecoration(labelText: 'Subject 4'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _subjectfiveController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject 5 marks';
                  }
                  // Add any additional validation logic here
                  return null;
                },
                decoration: InputDecoration(labelText: 'Subject 5'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _subjectsixController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject 6 marks';
                  }
                  // Add any additional validation logic here
                  return null;
                },
                decoration: InputDecoration(labelText: 'Subject 6'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _totalController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter total marks';
                  }
                  // Add any additional validation logic here
                  return null;
                },
                decoration: InputDecoration(labelText: 'Enter the Total Mark'),
              ),
            ),

            SizedBox(
              height: 120,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
          //          Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>MarkDisplay() ,
          //   ),
          // );
                  },
                  child: Text("Submit"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}