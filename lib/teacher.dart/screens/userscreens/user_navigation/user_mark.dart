import 'package:flutter/material.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/user_home.dart';

class UserMark extends StatefulWidget {
  const UserMark({super.key});

  @override
  State<UserMark> createState() => _UserMarkState();
}

class _UserMarkState extends State<UserMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 21, 67, 105),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StudentHome(),
            ));
          },
        ),
        title:const Text("Marks"),
        centerTitle: true,
        
      ),
    );
  }
}
