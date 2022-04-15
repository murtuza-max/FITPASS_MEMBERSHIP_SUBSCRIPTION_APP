import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

final String title="Personal Details";
class DetailsPage extends StatefulWidget {

  DetailsPage(title);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool showPassword = false;
  var phonenum;
  var height;
  var weight;
  var gender = "";
  var location = "";
  var dob = "";

  CollectionReference _collref = FirebaseFirestore.instance.collection('SignUpUser');

  void getUserInfo() async {

    final uid = await FirebaseAuth.instance.currentUser!.uid;
    final _doc = await _collref.doc(uid).get();
    print("UID : ");
    print(uid);

    setState(() {
      phonenum = _doc['Phone'];
      gender = _doc['gender'];
      height = _doc['height'];
      weight = _doc['weight'];
      location = _doc['location'];
      dob = _doc['dob'];

      print("Setstate:.....................");
    });

    print("Phone : ");
    print(phonenum);

    print("gender : ");
    print(gender);
    print("location : ");
    print(location);

    print("height : ");
    print(height);
    print("weight : ");
    print(weight);

    print("dob : ");
    print(dob);

  }


  @override
  void initState() {
    print("Init State............................");

    super.initState();
    getUserInfo();
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 35, top: 25, right: 16, bottom: 20),
          child: Text(title),
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

              SizedBox(height: 35,),
              Container(
                child: TextField(

                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Gender",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$gender",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    onChanged: (value) {
                      gender=value;
                    }
                ),
              ),

              SizedBox(height: 35,),
              Container(
                child: TextField(

                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Location",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$location",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    onChanged: (value) {
                      location=value;
                    }
                ),
              ),
              SizedBox(height: 35,),
              Container(
                child: TextField(
                    //obscureText: true,
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Mobile Number",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$phonenum",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    onChanged: (value) {
                      phonenum=value;
                    }
                ),
              ),
              SizedBox(height: 35,),
              Container(
                child: TextField(

                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "DOB",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$dob",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    onChanged: (value) {
                      dob=value;
                    }
                ),
              ),

              SizedBox(height: 35,),
              Container(
                child: TextField(

                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Height",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$height",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    onChanged: (value) {
                      height=value;
                    }
                ),
              ),
              SizedBox(height: 35,),
              Container(
                child: TextField(

                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Weight",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$weight",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    onChanged: (value) {
                      weight=value;
                    }
                ),
              ),

              SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      backgroundColor: Colors.deepPurpleAccent,
                      //side: BorderSide(width: 2),
                    ),
                    onPressed: () {},

                  ),
                  RaisedButton(
                    onPressed: () {
                      String usr = FirebaseAuth.instance.currentUser!.uid;
                      _collref.doc(usr).update({
                        'Phone': phonenum,
                        'gender': gender,
                        'height': height,
                        'weight': weight,
                        'loaction': location,
                        'dob': dob,
                      }).then((value) {
                        print('user data updated');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text(
                              "Data Updated Successfully.",
                              style: TextStyle(fontSize: 20.0),

                            ),
                          ),
                        );
                        //Navigator.pop(context);
                      });
                    },
                    color: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
