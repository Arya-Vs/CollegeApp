import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newcollege_app/edit_screens/edit_mark.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';

class MarkDisplay extends StatefulWidget {
  const MarkDisplay({super.key});

  @override
  State<MarkDisplay> createState() => _MarkDisplayState();
}

class _MarkDisplayState extends State<MarkDisplay> {
  List<Markmodel> markDetails = [];

  Future<void> getMarkData() async {
    List<Markmodel> markDetail = await getmark();
    setState(() {
      markDetails = markDetail;
    });
  }

  @override
  void initState() {
    getMarkData();
    super.initState();
  }

  Future<void> deleteItem(String mark) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Mark'),
        content: const Text('Are you sure you want to delete this Mark?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Don't delete
            },
             style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 21, 67, 105),
            ),
            child: const Text('Cancel',style: TextStyle(color: Colors.white),),
          ),
          TextButton(
            onPressed: ()async {
              Navigator.of(context).pop(true);
              await deletemark(mark);
              getMarkData();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Mark deleted'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                ),
              ); // Delete
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 21, 67, 105),
            ),
            child: const Text('Delete',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 21, 67, 105),
        title: Text('View Marks'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: markDetails.length,
        itemBuilder: (BuildContext context, int index) {
          Markmodel mark = markDetails[index];

          return Card(
            elevation: 5.0,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
           ),
           child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(31, 119, 117, 117),
                  borderRadius: BorderRadius.circular(10.0),
                 boxShadow:const [
                  BoxShadow(
                  color: Color.fromARGB(255, 221, 217, 217)
                ),
                ]
                ),
                padding: EdgeInsets.only(left: 10,top:1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(mark.semester,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),),
                    ),
                   Text('Subject 1  ${mark.subject1}',),
                   Text('Subject 2  ${mark.subject2}'),
                   Text('Subject 3  ${mark.subject3}'),
                   Text('Subject 4  ${mark.subject4}'),
                   Text('Subject 5  ${mark.subject5}'),
                   Text('Subject 6  ${ mark.subject6}'),
                   Text('total ${mark.total}')
                  ],
                ),
              ),
                Positioned(
              bottom: 0,
              left: 0,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditMarks(studetmarks: mark)));
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                     deleteItem(markDetails[index].markkey!);
                    },
                  ),
                ],
              ),
            ),
            ],
           ),
          );
        },
      ),
    );
  }

  Future<void> deletemark(String studentId) async {
  final box = await Hive.openBox<Markmodel>('mark_db');
  await box.delete(studentId);
}
}