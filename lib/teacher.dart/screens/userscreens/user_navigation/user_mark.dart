import 'package:flutter/material.dart';
import 'package:newcollege_app/functions/hive_function.dart';
import 'package:newcollege_app/model/marks/mark_model.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_home.dart';

class UserMark extends StatefulWidget {
  const UserMark({super.key});

  @override
  State<UserMark> createState() => _UserMarkState();
}

class _UserMarkState extends State<UserMark> {
  List<Markmodel> markdetails = [];

  Future<void> fetchmarkdetails() async {
    List<Markmodel> markdetailes = await getmark();
    setState(() {
      markdetails = markdetailes;
    });
  }

  @override
  void initState() {
    fetchmarkdetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 67, 105),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StudentHome(),
            ));
          },
        ),
        title: const Text("Marks"),
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final Markmodel mark = markdetails[index];
                return ListTile(

                  title:Text(
                    'Semester: ${mark.semester}',
                    style: TextStyle(color: Colors.white,fontSize: 20.0),
                    
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subject 1: ${mark.subject1}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Subject 2: ${mark.subject2}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Subject 3: ${mark.subject3}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Subject 4: ${mark.subject4}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Subject 5: ${mark.subject5}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Subject 6: ${mark.subject6}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Total Marks: ${mark.total}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
              childCount: markdetails.length,
            ),
          ),
        ],
      ),
    );
  }
}
