import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/Membershipcard/CancelMember.dart';

final String title = "FIT CARD";

class MemberpassPage extends StatefulWidget {
  MemberpassPage(title);

  @override
  _MemberpassPageState createState() => _MemberpassPageState();
}

class _MemberpassPageState extends State<MemberpassPage> {
  String email = ""; //murtaza@gmail.com
  String username = "";
  String Gender="";//murtaza
  String packagename = "No Package Available"; //murtaza
  var price = "";
  var DOA = "";
  var DOE = "";
  var image="";
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController packagenameController;
  late TextEditingController priceController;
  late TextEditingController doaController;
  late TextEditingController doeController;

  CollectionReference _collref =
      FirebaseFirestore.instance.collection('SignUpUser');

  void getUserInfo() async {
    final uid = await FirebaseAuth.instance.currentUser?.uid;
    final _doc = await _collref.doc(uid).get();
    print("UID : ");
    print(uid);

    setState(() {
      username =  _doc['Username'];
      email =  _doc['Email'];
      Gender =  _doc['gender'];
      packagename =  _doc['PackName'];
      image =  _doc['downloadUrl'];
      if (packagename == "No Package Available") {
        DOA = "";
        DOE = "";
      } else {
        DOA = _doc['Activate'];
        DOE = _doc['Expiry'];
      }

      if (packagename == 'Elite')
        price = "5000";
      else if (packagename == 'Pro')
        price = "10000";
      else if (packagename == 'Premium') price = "15000";
      print("Setstate:.....................");
      print("DownloadUrl : ");
      print(image);
    });
  }

  @override
  void initState(){
    print("Init State............................");

    super.initState();
    getUserInfo();
    emailController = new TextEditingController();
    priceController = new TextEditingController();
    doaController = new TextEditingController();
    doeController = new TextEditingController();
    packagenameController = new TextEditingController();
    usernameController = new TextEditingController();

    print('PacakageName :');
    print(packagename);
    print('Price :');
    print(price);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 75, top: 18, right: 16, bottom: 20),
          child: new Text('FIT CARD'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 209, 178, 214),
                Color.fromARGB(255, 148, 175, 187),
              ]),
        ),
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 5,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 120,
                      child: Center(
                        child: Stack(
                          children:<Widget>[

                            CircleAvatar(
                                radius: 100,
                                backgroundColor: Colors.deepPurple[200],

                              backgroundImage: image == "No Image" ? const NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                                  : NetworkImage(image),
                            ),


                          ],
                        ),
                      ),
                     /* decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black38),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: image == "No Image" ? const NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                                : NetworkImage(image),
                            //image:  Gender==('male') ? AssetImage('assets/images/boyDp.jpg') : AssetImage('assets/images/girldp4.jpg'),
                            fit: BoxFit.fill),
                      ),*/
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                  controller: packagenameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 13),
                    labelText: "Package ",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "$packagename",
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
                    controller: priceController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Price",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: price,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    onChanged: (value) {}),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Date of Activation",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$DOA",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    onChanged: (value) {}),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Date of Expiry",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$DOE",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    onChanged: (value) {}),
              ),
              SizedBox(height: 45),

              //Renewal of pass......................
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      if (packagename == "No Package Available") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent[200],
                            content: Text(
                              "Curently No pacakge Selected!! Buy From Packages or Upgrade Your Pacakage",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          var date = new DateTime.now().toString();
                          var dateParse = DateTime.parse(date);
                          var formdate =
                              "${dateParse.day}/${dateParse.month}/${dateParse.year}";
                          DOA = formdate.toString();
                          var adddate =
                              "${dateParse.day}/${dateParse.month + 1}/${dateParse.year}";
                          DOE = adddate.toString();
                          packagename = packagename;
                          price = price;
                        });

                        String? usr =
                            await FirebaseAuth.instance.currentUser?.uid;
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
                                "Membership Package Renewed Successfully..",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                            ),
                          ); //Navigator.pop(context);
                        });
                      }
                    },
                    color: Color.fromARGB(255, 146, 117, 226),
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 15),
                    child: Text(
                      "Renew",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),

                  //Update Pass..................
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UpdatepassPage("Update Card");
                          },
                        ),
                      );
                    },
                    color: Color.fromARGB(255, 146, 117, 226),
                    padding: EdgeInsets.fromLTRB(112, 10, 112, 15),
                    child: Text(
                      "Upgrade",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),

                  //Cancel pass...................
                  RaisedButton(
                    onPressed: () async {
                      if (packagename == "No Package Available") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent[200],
                            content: Text(
                              "Curently No pacakge Available to Cancel!!",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          DOA = "";
                          DOE = "";
                          packagename = "No Package Available";
                          price = "";
                        });

                        String? usr =
                            await FirebaseAuth.instance.currentUser?.uid;
                        _collref.doc(usr).update({
                          'PackName': "No Package Available",
                          'Activate': DOA,
                          'Expiry': DOE,
                        }).then((value) {
                          print('package updated');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.deepPurpleAccent[100],
                              content: Text(
                                "Membership Package Canceled Successfully..",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                            ),
                          ); //Navigator.pop(context);
                        });
                      }
                    },
                    color: Color.fromARGB(255, 146, 117, 226),
                    padding: EdgeInsets.fromLTRB(118, 10, 118, 15),
                    child: Text(
                      "Cancel",
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
