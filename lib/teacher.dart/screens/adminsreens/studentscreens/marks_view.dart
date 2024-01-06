import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';

class ViewMarks extends StatefulWidget {
  const ViewMarks({super.key});

  @override
  State<ViewMarks> createState() => _ViewMarksState();
}

class _ViewMarksState extends State<ViewMarks> {
  List<Markmodel> markdetailes = [];

  Future<void> addMarkData() async {
    List<Markmodel> markdetaile = await getmark();
    setState(() {
      markdetailes = markdetaile;
    });
  }

  @override
  void initState() {
    addMarkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 21, 67, 105),
        title: Text('View Marks'),
        centerTitle: true,
      ),
    );
  }
}
