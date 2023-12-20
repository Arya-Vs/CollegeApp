import 'package:flutter/material.dart';
import 'package:newcollege_app/model/teacher_add.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
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
          title: Text(widget.teacher.department,style: TextStyle(fontSize: 20.0),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 21, 67, 105),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.teacher.sem1,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 21, 67, 105),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.teacher.sem2,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 21, 67, 105),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.teacher.sem2,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 21, 67, 105),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.teacher.sem2,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 21, 67, 105),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.teacher.sem2,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 21, 67, 105),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.teacher.sem2,
                            style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 250, 248, 248)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
