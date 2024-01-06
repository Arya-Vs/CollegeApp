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
  List<Markmodel> markdetailes = [];

  Future<void>fetchmark()async{
    List<Markmodel>markdetaile=await getmark();
    setState(() {
      markdetailes =markdetaile;
    });

  }
@override
  void initState() {
    fetchmark();
    super.initState();
  }

  // Future <Void>deletemark(Markmodel marks )async{
  //   bool confirmDelete =await showDialog(
  //     context: context,
  //      builder: (context) => AlertDialog(
  //       title: Text('Delete Marks'),
  //       content: Text('Are you sure you want to delete this marks?'),
  //       actions: [
  //         TextButton(
  //         onPressed: () {
  //             Navigator.of(context).pop(false); // Don't delete
  //           },
  //            child: Text('Cancel'),
  //            ),
  //            TextButton(
  //             onPressed: (){
  //                onPressed: () {
  //             Navigator.of(context).pop(true);
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(
  //                 content: Text(
  //                   'Item deleted',
  //                 ),
  //                 duration: Duration(seconds: 2),
  //                 backgroundColor: Colors.green,
  //               ),
  //             ); // Delete
  //           };

  //            }, child: Text('Delete'))
  //       ],
  //      ),
  //      );
  //          if (confirmDelete == true) {
  //     deleteTimetable(marks.markkey.toString());
  //     fetchmark();
  //     // ignore: use_build_context_synchronously
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text(' deleted'),
  //         duration: Duration(seconds: 2),
  //         backgroundColor: Colors.green,
  //       ),
  //     );
  //   }

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 67, 105),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        title: const Text("Mark Display"),
        centerTitle: true,
      ),
     
    );
  }
}