import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 21, 67, 105),
        title: const Text("About"),
        centerTitle: true,

      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Text("About ",
            // style: TextStyle(
            //   fontSize: 20.0,
              
            // ),
            // ),
            SizedBox(height: 16.0,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Welcome to MY COLLEGE app, your go-to destination for seamless communication and information sharing within our college community. Developed with a focus on simplicity and efficiency, our app bridges the gap between teachers and students, fostering a collaborative and organized learning environment.",
              
              style:TextStyle(fontSize: 16.0),),
            ),
            SizedBox(height: 16.0,),
            Text("Features:",
            style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 16.0,),
            Text("Teacher Administration : Empowering our dedicated educators, [Your App Name] allows teachers to effortlessly add and manage student details, ensuring accurate and up-to-date records.",
           ),SizedBox(height: 16.0,),
            Text("Timetable Updates : Stay ahead of your schedule with real-time updates on upcoming timetables. Teachers can easily input and modify timetable dates, providing students with timely information to plan their academic activities effectively."
           ),SizedBox(height: 16.0,),
           Text("Effortless Grade Management : Simplify the grading process with our intuitive mark entry system. Teachers can input and update student marks efficiently, contributing to a transparent and accessible assessment process.",
           ),
           SizedBox(height: 16.0,),
           Text("Student Profiles : Students have access to personalized profile pages, giving them a comprehensive view of their academic journey. Keep track of your achievements, attendance, and more in one centralized location.",
           ),
           SizedBox(height: 16.0,),
           Text("User-Friendly Interface : Our app boasts a user-friendly interface that ensures a smooth experience for both teachers and students. Navigation is intuitive, and information is presented in a clear and organized manner.",
           ),
           SizedBox(height: 16.0,),
           Text("Privacy Matters : We prioritize the privacy and security of your data. [Your App Name] is designed with robust security measures to protect sensitive information, ensuring a safe digital space for all users." 
           ),
           SizedBox(height: 16.0,),
           Text("Transparent Communication : Foster transparent communication between teachers and students. [Your App Name] facilitates direct communication channels, making it easier for students to seek clarification and guidance from their teachers. ",
           ),
           SizedBox(height: 16.0,),
           Text("Terms and Policies : Learn more about our terms of service, privacy policy, and other important details. We believe in transparency, and you can find all the necessary information regarding app usage and data handling in our dedicated section."
           ),
           SizedBox(height: 16.0,),
           Text("MY COLLEGE is more than just an app; it's a tool for enhancing the educational experience and creating a connected community within our college. Join us on this journey of seamless communication, efficient management, and collaborative learning.")
          ],
        ),
      ),
    );
  }
}