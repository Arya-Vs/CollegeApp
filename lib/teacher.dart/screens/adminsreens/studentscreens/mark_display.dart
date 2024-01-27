import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newcollege_app/edit_screens/edit_mark.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';

class MarkDisplay extends StatefulWidget {
  MarkDisplay({super.key, this.keymark});

  var keymark; 

  @override
  State<MarkDisplay> createState() => _MarkDisplayState();
}
class _MarkDisplayState extends State<MarkDisplay> {
  late Box<Markmodel> markdetailbox;
 late List<Markmodel> markDetails;

  // Future<void> getMarkData() async {
  //   try {
  //     List<Markmodel> markDetail = await getmark();
  //     setState(() {
  //       markDetails = markDetail;
  //       print('object: $markDetails');
  //     });
  //   } catch (error) {
  //     print('Error fetching mark data: $error');
  //     // Handle the error as needed (e.g., show an error message)
  //   }
  // }

  @override
  void initState() {
    markdetailbox = Hive.box<Markmodel>('mark_db');
    markDetails = markdetailbox.values.toList();
   // getMarkData();
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
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
              await deletemark(mark);
             // getMarkData();
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
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
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
        title: const Text('View Marks'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: markdetailbox.listenable(),
        builder: (context, Box<Markmodel> box, widget) {
          markDetails = box.values.toList();
          return ListView.builder(
          itemCount: markDetails.length,
          itemBuilder: (BuildContext context, int index) {
            final mark = markDetails[index];
          
            // var key = markDetails[index].markkey;
            print('kk ${mark.markkey}');
      
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft, // Align to top-left
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 300.0, // Adjust the width as needed
                        height: 250.0, // Adjust the height as needed
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(31, 119, 117, 117),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 21, 67, 105),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                mark.semester,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Center(
                                child: Text(
                              'Subject 1: ${mark.subject1}',
                              style: const TextStyle(color: Colors.white),
                            )),
                            const SizedBox(height: 8),
                            Center(
                                child: Text('Subject 2: ${mark.subject2}',
                                    style: const TextStyle(color: Colors.white))),
                            const SizedBox(height: 8),
                            Center(
                                child: Text('Subject 3: ${mark.subject3}',
                                    style: const TextStyle(color: Colors.white))),
                            const SizedBox(height: 8),
                            Center(
                                child: Text('Subject 4: ${mark.subject4}',
                                    style: const TextStyle(color: Colors.white))),
                            const SizedBox(height: 8),
                            Center(
                                child: Text('Subject 5: ${mark.subject5}',
                                    style: const TextStyle(color: Colors.white))),
                            const SizedBox(height: 8),
                            Center(
                                child: Text('Subject 6: ${mark.subject6}',
                                    style: const TextStyle(color: Colors.white))),
                            const SizedBox(height: 8),
                            Center(
                                child: Text('Total: ${mark.total}',
                                    style: const TextStyle(color: Colors.white))),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0, // Align to right side
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                print('ontap ${mark.markkey}');
                                // Navigate to the EditMarks screen and wait for the result
                                final result = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditMarks(studetmarks: mark, keymark: mark.markkey),
                                  ),
                                );
                                if (result != null && result) {
                                  // Refresh data when returning from EditMarks
                                 // getMarkData();
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                deleteItem(mark.markkey!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
        },
      
      ),
    );
  }

  Future<void> deletemark(String studentId) async {
    final box = await Hive.openBox<Markmodel>('mark_db');
    box.delete(studentId);
    //await box.delete(studentId);
  }
}