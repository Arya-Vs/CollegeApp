import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newcollege_app/model/user/user_model.dart';
import 'package:newcollege_app/screens/adminsreens/navigation.dart';
import 'package:newcollege_app/screens/auth/adminside/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const SizedBox(
                height: 90,
              ),
              const Text(
                "Hello Admin",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Sign in to continue",
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
              // Center(
              //   child: Column(
              //     children: [
              //       Image.asset(
              //         "assets/images/Animation - 1700212306467.gif",
              //         width: 150,
              //         height: 200,
              //       )
              //     ],
              //   ),
              // ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        errorText: _errorText.isNotEmpty ? _errorText : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        if (!value.contains("@gmail.com")) {
                          return "please enter your valid Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        errorText: _errorText.isNotEmpty ? _errorText : null,
                        
                        
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 70),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                           ////// Check if the user exists in Hive//////
                            var usersBox = Hive.box<User>('users');
                            User? user;
                            try {
                              user = usersBox.values.firstWhere(
                                (user) =>
                                    user.username == usernameController.text,
                              );
                            } catch (e) {
                            
                              setState(() {
                                _errorText = 'Invalid username or password';
                              });
                              return;
                            }

                            if (user.username == usernameController.text &&
                                user.password == passwordController.text) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('userKey', user.id);
                             
                              print(
                                  'Login successful for user: ${user.username}');

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const BottomNavWidget(),
                                ),
                              );

                              //  snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Welcome, ${user.username}!'),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              setState(() {
                                _errorText = 'Invalid username or password';
                              });
                            }
                          } else {
                            setState(() {
                              _errorText =
                                  'Please fill in both username and password';
                            }
                            );
                          }
                        },
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 21, 67, 105))),
                       
                        child: const Text('LOG IN'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text('SIGN UP',
                      style: TextStyle(
                        color: Color.fromARGB(255, 21, 67, 105)
                      ),),
                    ),


                  //     Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //             builder: (context) => const SignUpScreen()),
                  //       );
                  //     },
                  //     child: const Text(
                  //       'Admin',
                  //       style: TextStyle(
                  //         color: Color.fromARGB(255, 21, 67, 105),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}