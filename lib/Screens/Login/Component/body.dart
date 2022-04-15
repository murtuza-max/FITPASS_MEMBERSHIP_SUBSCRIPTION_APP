import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/component/background.dart';

import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_acoount.dart';

import 'package:flutter_auth/Screens/reset_password.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/ProfilePage/startPage.dart ';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> sf1=new GlobalKey<ScaffoldState>();
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  int isloading=0;
  bool isloadings=false;
  var emailid;
  var password;
  var username;
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();
  late CollectionReference _collref;
  late DatabaseReference _baseref;

  void initState() {
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    usernameController = new TextEditingController();
    _collref = FirebaseFirestore.instance.collection('SignUpUser');
    _baseref = FirebaseDatabase.instance.reference().child('SignUpUser');
    isloadings=false;
    isloading=0;

  }

  @override
  Future<void> userLogin(String email, String password) async {
    try {
      var success = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailid, password: password);


       //CircularProgressIndicator(color: Colors.white,);

      ScaffoldMessenger.of(context).showSnackBar(
         new SnackBar(
          backgroundColor: Colors.deepPurpleAccent[100],
          content: Text(
            "Login Successfull.",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
      setState(() {
        isloading=1;
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // AsyncSnapshot<QuerySnapshot> snapshot;
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.02),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.orangeAccent,
                            content: Text(
                              "Please Enter Username",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                        );
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.people_alt_outlined,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter Username",
                        fillColor: Colors.white70),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.orangeAccent,
                            content: Text(
                              "Please Enter your Email",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                        );
                      } else if (!value.contains('@')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromARGB(255, 253, 83, 41),
                            content: Text(
                              "Please Enter Valid Email Id!!",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                        );
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.people_alt_outlined,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Your Email",
                        fillColor: Colors.white70),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.orangeAccent,
                              content: Text(
                                "Please Enter Your Password",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                          );
                        }

                        return null;
                      },
                      obscureText: true ? showPassword : false,
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.lock,
                              color: Colors.deepPurple,
                            ),
                          ),
                          suffixIcon: true
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: Icon(Icons.remove_red_eye,
                                      color: Colors.deepPurpleAccent),
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Password",
                          fillColor: Colors.white70),
                      onChanged: (value) {
                        password = value;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(200, 19, 6, 16),
                  child: Row(
                    children: [
                      // Spacer(),

                      GestureDetector(
                        onTap: () async => {
                          //  await FirebaseAuth.instance.signOut(),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(),
                            ),
                          ),
                        },
                        // },
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 150, 115, 247),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color.fromARGB(255, 197, 172, 240),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, otherwise false.

                      isloadings = true;
                      final SharedPreferences sharedprefernce =
                          await SharedPreferences.getInstance();
                      emailid = emailController.text;
                      username = usernameController.text;
                      password = passwordController.text;

                      sharedprefernce.setString('email', emailController.text);
                      sharedprefernce.setString(
                          'password', passwordController.text);

                      if ((username == null || username.isEmpty)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.orangeAccent,
                            content: Text(
                              "Please Enter Username",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                        );
                      } else {
                        if (emailid == null || emailid.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.orangeAccent,
                              content: Text(
                                "Please Enter your Email",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                          );
                        } else if (!emailid.contains('@')) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Color.fromARGB(255, 253, 83, 41),
                              content: Text(
                                "Please Enter Valid Email Id!!",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                          );
                        } else {
                          if (password == null || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.orangeAccent,
                                content: Text(
                                  "Please Enter Your Password",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                ),
                              ),
                            );
                          }
                        }
                      }

                      await userLogin(emailController.text, passwordController.text).whenComplete(() async{
                        Timer(Duration(seconds: 2),() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StartApp(),
                          ),
                        ),
                        );
                      });

                    },
                    child: isloadings
                        ? Text(
                            "Loding...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    isloadings = false;
    super.dispose();
  }
}
