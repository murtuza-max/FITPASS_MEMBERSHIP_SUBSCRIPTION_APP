import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/already_have_an_acoount.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/ProfilePage/startPage.dart ';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {


  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  late TextEditingController phonenumController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController genderController;
  late TextEditingController locationController;
  late TextEditingController dobController;
  var username = "";
  var emailid = "";
  var password = "";
  var phonenum ="";
  var height="";
  var weight="";
  var gender = "";
  var location = "";
  var dob = "";
  var package="";
  bool showPassword =false;
  bool isloading = false;


  final _formKey = GlobalKey<FormState>();
  CollectionReference _collref= FirebaseFirestore.instance.collection('SignUpUser');
  DatabaseReference _baseref=FirebaseDatabase.instance.reference().child('SignUpUser');

  @override
  void initState() {
    super.initState();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    usernameController = new TextEditingController();
    phonenumController = new TextEditingController();
    genderController = new TextEditingController();
    heightController = new TextEditingController();
    weightController = new TextEditingController();
    dobController = new TextEditingController();
    locationController = new TextEditingController();
    _collref = FirebaseFirestore.instance.collection('SignUpUser');
    _baseref = FirebaseDatabase.instance.reference().child('SignUpUser');
    isloading=false;
  }

   Future<void> registration() async {
     try {
       await FirebaseAuth.instance
           .createUserWithEmailAndPassword(
           email: emailid, password: password);

       String usr = FirebaseAuth.instance.currentUser!.uid;
       await _collref.doc(usr).set({
         'Username': username,
         'Email': emailid,
         'password': password,
         'Phone': phonenum,
         'height': height,
         'weight': weight,
         'gender': gender,
         'location': location,
         'dob': dob,
         'PackName': package,
         'downloadUrl':"No Image",
       }).then((value) {
         print('user added'); //Navigator.pop(context);
       });

       reguser();
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           backgroundColor: Colors.deepPurpleAccent[100],
           content: Text(
             "Registered Successfully..",
             style: TextStyle(fontSize: 20.0),
           ),
         ),
       );

     } on FirebaseAuthException catch (e) {
       if (e.code == 'weak-password') {
         print("Password Provided is too Weak");
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             backgroundColor: Colors.orangeAccent,
             content: Text(
               "Password Provided is too Weak",
               style: TextStyle(
                   fontSize: 18.0, color: Colors.black),
             ),
           ),
         );
       } else if (e.code == 'email-already-in-use') {
         print("Account Already exists");
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             backgroundColor: Colors.orangeAccent,
             content: Text(
               "Account Already exists",
               style: TextStyle(
                   fontSize: 18.0, color: Colors.black),
             ),
           ),
         );
       }
     }
     setState(() {
       isloading=true;
     });
   }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        //   key: _formKey,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.35,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: usernameController,
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
                        /*errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),*/
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
                        /*errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),*/
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
                        fillColor: Colors.white70
                    ),

                        onChanged: (value) {
                        password = value;
                      }
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: phonenumController,
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.phone,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        /*errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),*/
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter Contact Number",
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
                    controller: locationController,
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.place,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        /*errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),*/
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter Your City",
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
                    controller: dobController,
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        /*errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),*/
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter DOB",
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
                    controller: heightController,
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        /*errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),*/
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter Height",
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
                    controller: weightController,
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        /*errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),*/
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter Weight",
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
                    controller: genderController,
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.transgender_sharp,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        /*errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),*/
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Gender",
                        fillColor: Colors.white70),
                    onChanged: (value) {},
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () async {

                      emailid = emailController.text;
                      password = passwordController.text;
                      username = usernameController.text;
                      phonenum = phonenumController.text;
                      height = heightController.text;
                      weight = weightController.text;
                      gender = genderController.text;
                      location = locationController.text;
                      dob = dobController.text;
                      package="No Package Available";

                      print("Username : ");
                      print(username);
                      print("email Id : ");
                      print(emailid);
                      print("password : ");
                      print(password);

                      //registration();
                      await registration().whenComplete(() async{
                        Timer(Duration(seconds: 2),() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StartApp(),
                          ),
                        ),
                        );
                      });

                    },

                    child: isloading ? Text(
                    "Loding...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.deepPurple),
                  ):
                    Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.deepPurple),
                    ),
                    // Text("Register"),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
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
    phonenumController.dispose();
    locationController.dispose();
    heightController.dispose();
    weightController.dispose();
    genderController.dispose();
    dobController.dispose();

    super.dispose();
  }

  void reguser() async{
    String email = emailController.text;
    String password = passwordController.text;

    String username =usernameController.text;
    String phonenum=phonenumController.text;
    String height= heightController.text;
    String weight  =weightController.text;
    String gender =genderController.text;
    String location= locationController.text;
    String dob= dobController.text;


    Map<String, String> SignUpUser = {
      'Email': email,
      'password': password,
      'Phone': phonenum,
      'Username': username,
      'height': height,
      'weight': weight,
      'dob': dob,
      'location': location,
      'gender': gender,
    };

    await _baseref.push().set(SignUpUser).then((value) {
      Navigator.pop(context);
    });
  }
}
