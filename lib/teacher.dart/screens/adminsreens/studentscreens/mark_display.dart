import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';

class MarkDisplay extends StatefulWidget {
  const MarkDisplay({super.key});

  @override
  State<MarkDisplay> createState() => _MarkDisplayState();
}

class _MarkDisplayState extends State<MarkDisplay> {
  List<Markmodel> markDetails = [];

  Future<void> fetchMarks() async {
    List<Markmodel> markDetail = await getmark();
    setState(() {
      markDetails = markDetail;
    });
  }

  @override
  void initState() {
    fetchMarks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        title: const Text("Mark Display"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: markDetails.length,
        itemBuilder: (context, index) {
          Markmodel mark = markDetails[index];
          return ListTile(
            title: Text('Department: ${mark.department}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Subject: ${mark.subject1}'),
                Text('Marks: ${mark.marks}'),
                // Add other fields as needed
              ],
            ),
            // Add delete functionality if needed
            // onTap: () {
            //   // Add onTap logic
            // },
          );
        },
      ),
    );
  }
}