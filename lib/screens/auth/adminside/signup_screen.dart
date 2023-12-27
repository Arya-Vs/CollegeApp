import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newcollege_app/model/user/user_model.dart';
import 'package:newcollege_app/screens/adminsreens/navigation.dart';
import 'package:newcollege_app/screens/auth/userside/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    bool _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String _usernameError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext ctx) =>const StudentLogin()
                         
                    ));
            },
        ),
        centerTitle: true,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const  SizedBox(
              height: 20,
            ),
            const Text(
              'Sign up to continue',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      errorText: _usernameError.isNotEmpty ? _usernameError : null,
                    ),
                    validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        if (!value.contains("@gmail.com")) {
                          return "please enter your valid Email";
                        }
                        return null;
                      },
                  ),
                  const SizedBox(height: 27),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      suffixIcon:  IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                      errorText: _passwordError.isNotEmpty ? _passwordError : null,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 27),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'CONFIRM PASSWORD',
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
                      errorText: _confirmPasswordError.isNotEmpty ? _confirmPasswordError : null,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 27),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _usernameError = usernameController.text.isEmpty ? 'Please enter your username' : '';
                        _passwordError = passwordController.text.isEmpty ? 'Please enter your password' : '';
                        _confirmPasswordError = confirmPasswordController.text.isEmpty
                            ? 'Please confirm your password'
                            : (confirmPasswordController.text != passwordController.text ? 'Passwords do not match' : '');

                        if (_formKey.currentState!.validate()) {
                          // Generate a unique id for the user
                          String userId = DateTime.now().millisecondsSinceEpoch.toString();

                          // Create a new User object
                          User newUser = User(
                            username: usernameController.text,
                            password: passwordController.text,
                            id: userId,
                          );

                          // Save the user to Hive
                          var usersBox = Hive.box<User>('users');
                          usersBox.put(userId, newUser);

                          // Show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                           const  SnackBar(
                              content: Text('Signed up successfully!',
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.green,
                              
                            ),
                          );
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavWidget(),));
                        }
                      });
                    },
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 21, 67, 105),)                  ),
                    child: const Text('SIGN UP'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
