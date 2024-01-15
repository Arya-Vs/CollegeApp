import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/timetable/timetable_model.dart';
import 'package:newcollege_app/edit_screens/edit_timetable.dart';

class TimeView extends StatefulWidget {
  const TimeView ({super.key});

  @override
  State<TimeView> createState() => _TimeViewState();
}


class _TimeViewState extends State<TimeView> {
  List<TimeTableModel> timetabledetailes = [];

  Future<void> fetchtimetabledetails() async {
    List<TimeTableModel> timetabledetaile = await getAllTimetable();
    setState(() {
      timetabledetailes = timetabledetaile;
    });
  }

  @override
  void initState() {
    fetchtimetabledetails();
    super.initState();
  }

  Future<void> deleteItem(String timetable) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Timetable'),
        content: const Text('Are you sure you want to delete this Timetable?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Don't delete
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 21, 67, 105),
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: ()async {
              Navigator.of(context).pop(true);
              await deleteTimetable(timetable);
              fetchtimetabledetails();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Item deleted',
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                ),
              ); // Delete
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
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
        title: const Text("Exam Time Table"),
        centerTitle: true,
      ),
  body: GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
  ),
  itemCount: timetabledetailes.length,
  itemBuilder: (BuildContext context, int index) {
    TimeTableModel timetable = timetabledetailes[index];

    // Adjust the margin for the first two items
    EdgeInsets cardMargin = EdgeInsets.zero;
    if (index == 0|| index == 2) {
      cardMargin = EdgeInsets.only(top: 8.0); // Add the desired top margin
    }

    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // alignment: Alignment.centerRight, // Align the card to the right
      // child: Container(
      //   width: MediaQuery.of(context).size.width / 5.5, // Adjust the width as needed
      //   height: MediaQuery.of(context).size.width / 3, // Adjust the height as needed
        // margin: cardMargin, // Apply margin
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
              padding:  const EdgeInsets.only(left: 10,top:1), // Adjust left padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      timetable.subject,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Date:   ${timetable.date}',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ),
                  Text(
                    'Time:  ${timetable.time}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
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
                        builder: (context) => EditTimeTable(timeTable: timetable),
                      ));
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                    deleteItem(timetabledetailes[index].timetablekey!);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      // ),
    );
  },
),
);

  }
}
