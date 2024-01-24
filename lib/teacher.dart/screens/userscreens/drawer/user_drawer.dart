import 'package:flutter/material.dart';
import 'package:newcollege_app/teacher.dart/screens/auth/userside/login.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/about/about.dart';
import 'package:newcollege_app/teacher.dart/screens/userscreens/privacy_policy/privacy_policy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({super.key});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 21, 67, 105),
            Colors.black,
          ], // Example gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 6,
                ),
                // const Text(
                //   'User Name',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ),
          customListTile(
            icon: Icons.history,
            title: 'About',
            onTap: () {
              // Handle the History option tap
              Navigator.of(context).pop(); // Close the drawer
               Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ),
              );
            },
          ),
          
          customListTile(
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            onTap: () {
              // Handle the Privacy Policy option tap
              Navigator.of(context).pop(); // Close the drawer
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicy(),
                ),
              );
            },
          ),
          customListTile(
            icon: Icons.logout_outlined,
            title: 'Log out',
            onTap: () {
              // Show confirmation dialog
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("LOGOUT"),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.clear().then((value) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const StudentLogin(),
                            ),
                            (Route route) => false,
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
                      ),
                      child: const Text("YES"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 21, 67, 105),
                      ),
                      child: const Text("NO"),
                    )
                  ],
                );
              },
            );
            },
          ),
          // Add more custom list tiles as needed
        ],
      ),
    );
  }

  Widget customListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }
}