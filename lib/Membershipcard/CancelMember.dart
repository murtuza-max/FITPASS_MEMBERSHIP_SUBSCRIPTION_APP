import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String title = "Upgrade Card";

class UpdatepassPage extends StatefulWidget {
  UpdatepassPage(title);

  @override
  _UpdatepassPageState createState() => _UpdatepassPageState();
}

class _UpdatepassPageState extends State<UpdatepassPage> {
  String email = ""; //murtaza@gmail.com
  String username = ""; //murtaza
  var packagename = ""; //murtaza
  var currpack = "";
  var newpack = "";
  var price = "";
  var DOA = "";
  var DOE = "";
  late TextEditingController emailController;
  late TextEditingController packagenameController;
  late TextEditingController usernameController;
  late TextEditingController currpackController;
  late TextEditingController newpackController;
  late TextEditingController priceController;

  CollectionReference _collref =
      FirebaseFirestore.instance.collection('SignUpUser');

  void getUserInfo() async {

    final uid = await FirebaseAuth.instance.currentUser?.uid;
    final _doc = await _collref.doc(uid).get();
    print("UID : ");
    print(uid);

    setState(() {
      username = _doc['Username'];
      email = _doc['Email'];
      currpack = _doc['PackName'];
      //password = _doc['password'];

      print("Setstate:.....................");
    });

    print("Username : ");
    print(username);

    print("Email : ");
    print(email);
  }

  @override
  void initState() {
    print("Init State............................");

    super.initState();
    getUserInfo();
    emailController = new TextEditingController();
    packagenameController = new TextEditingController();
    usernameController = new TextEditingController();
    currpackController = new TextEditingController();
    newpackController = new TextEditingController();
    priceController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 55, top: 25, right: 16, bottom: 20),
          child: new Text(title),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 13),
                    labelText: "Enter Username",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 13),
                    labelText: "Enter Email Address",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                  controller: currpackController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 13),
                    labelText: "Current Package Name",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Elite/Pro/Premium",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                  controller: newpackController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 13),
                    labelText: "New Package Name",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Elite/Pro/Premium",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 45),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {
                      int cnt;
                      var pv = "";

                      if (usernameController.text == "$username" &&
                          emailController.text == "$email" &&
                          currpackController.text == "$currpack") {
                        if (newpackController.text == "Elite") {
                          cnt = 1;
                          pv = "5000";
                        } else if (newpackController.text == "Pro") {
                          cnt = 3;
                          pv = "10000";
                        } else {
                          cnt = 6;
                          pv = "15000";
                        }

                        setState(() {
                          var date = new DateTime.now().toString();
                          var dateParse = DateTime.parse(date);
                          var formdate =
                              "${dateParse.day}/${dateParse.month}/${dateParse.year}";
                          DOA = formdate.toString();
                          var adddate =
                              "${dateParse.day}/${dateParse.month + cnt}/${dateParse.year}";
                          DOE = adddate.toString();
                          packagename = newpackController.text;
                          price = pv;
                        });
                        String? usr = FirebaseAuth.instance.currentUser?.uid;
                        _collref.doc(usr).update({
                          'PackName': packagename,
                          'Activate': DOA,
                          'Expiry': DOE,
                        }).then((value) {
                          print('package updated');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.deepPurpleAccent[100],
                              content: Text(
                                "Package Data Updated Successfully.",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ); //Navigator.pop(context);
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent[100],
                            content: Text(
                              "Details Doesn't Match!!",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ); //Navigator.pop(context);
                      }
                    },
                    color: Colors.deepPurpleAccent,
                    padding: EdgeInsets.fromLTRB(53, 10, 53, 15),
                    child: Text(
                      "Upgrade Pacakage",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
