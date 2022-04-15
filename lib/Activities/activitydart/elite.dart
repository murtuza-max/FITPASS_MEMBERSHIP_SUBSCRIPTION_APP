import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/roundedbutton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_auth/Activities/Screen/elitegyms_list_screen.dart';
import 'package:flutter_auth/Activities/Screen/yoga_list_screen.dart';
import 'package:flutter_auth/Activities/Screen/zumba_list_screen.dart';

class Elite extends StatefulWidget {
  const Elite({Key? key}) : super(key: key);

  @override
  _EliteState createState() => _EliteState();
}

class _EliteState extends State<Elite> {
  String email = ""; //murtaza@gmail.com
  String username = ""; //murtaza
  String packagename = "No Package Available"; //murtaza
  var price = "";
  var DOA = "";
  var DOE = "";

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
      username = _doc['Username'];
      email = _doc['Email'];
      packagename = _doc['PackName'];
      if (packagename == "No Package Available") {
        DOA = "";
        DOE = "";
      } else {
        DOA = _doc['Activate'];
        DOE = _doc['Expiry'];
      }

      if (packagename == 'Elite')
        price = "2000";
      else if (packagename == 'Pro')
        price = "4000";
      else if (packagename == 'Premium') price = "8000";
      print("Setstate:.....................");
    });
  }

  @override
  void initState() {
    print("Init State............................");

    super.initState();
    getUserInfo();
    emailController = new TextEditingController();
    priceController = new TextEditingController();
    doaController = new TextEditingController();
    doeController = new TextEditingController();
    packagenameController = new TextEditingController();
    usernameController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(30, 3, 10, 3),
            child: Text("ELITE MEMBERSHIP"),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/eltbgi.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: Container(
              child: ListView(
                padding: EdgeInsets.fromLTRB(3, 19, 3, 6),
                children: [
                  buildEliteClubs(),
                  buildYogaClass(),
                  buildZumbaClass(),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.fromLTRB(20, 200, 20, 20),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      color: Color.fromARGB(255, 150, 115, 247),
                      onPressed: () async {
                        if (packagename == "No Package Available") {


                          setState(() {
                            var date = new DateTime.now().toString();
                            var dateParse = DateTime.parse(date);
                            var formdate =
                                "${dateParse.day}/${dateParse.month}/${dateParse.year}";
                            DOA = formdate.toString();
                            var adddate =
                                "${dateParse.day}/${dateParse.month + 1}/${dateParse.year}";
                            DOE = adddate.toString();
                            packagename = 'Elite';
                            price = '5000';
                          });

                          String? usr =
                              await FirebaseAuth.instance.currentUser?.uid;
                          _collref.doc(usr).update({
                            'PackName': packagename,
                            'Activate': DOA,
                            'Expiry': DOE,
                          }).then((value) {
                            print('package updated at database');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.deepPurpleAccent[200],
                                content: Text(
                                  "Purchase Successfull",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                ),
                              ),
                            );
                          });
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.redAccent[200],
                              content: Text(
                                "Already Package Exist!!",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                          );
                        }
                      },
                      /* onPressed: () => Fluttertoast.showToast(
                    msg: 'Purchase Successful',
                    fontSize: 18,
                  ),*/
                      //   color: Color.fromARGB(255, 146, 117, 226),
                      //padding: EdgeInsets.fromLTRB(11, 10, 112, 15),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            fontSize: 15,
                            //letterSpacing: 2.2,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildEliteClubs() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage(
                'assets/images/eltclbs.jpg',
              ),
              //colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ElitegymsListScreen()));
                },
              ),
              height: 120,
              fit: BoxFit.cover,
            ),
            Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

  Widget buildYogaClass() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage(
                'assets/images/ycls.jpg',
              ),
              //colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YogaListScreen()));
                },
              ),
              height: 120,
              fit: BoxFit.cover,
            ),
            Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

  Widget buildZumbaClass() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage(
                'assets/images/zumcls.jpg',
              ),
              //colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ZumbaListScreen()));
                },
              ),
              height: 120,

              //width: 200,
              fit: BoxFit.fill,
            ),
            Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
}
