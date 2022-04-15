//import 'dart:html';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String email = ""; //murtaza@gmail.com
  String username = "";
  String Gender="";//murtaza
  var password = ""; //murtaza
  var member;
  var image="";


  CollectionReference _collref =
      FirebaseFirestore.instance.collection('SignUpUser');

  void getUserInfo() async {
    final uid = await FirebaseAuth.instance.currentUser!.uid;
    final _doc = await _collref.doc(uid).get();
    print("UID : ");
    print(uid);
    setState(() {
      username = _doc['Username'];
      email = _doc['Email'];
      Gender = _doc['gender'];
      image = _doc['downloadUrl'];
      print("Setstate:.....................");
    });

    print("Username : ");
    print(username);

    print("Email : ");
    print(email);
    print("DownloadUrl : ");
    print(image);
  }

  @override
  void initState() {
    print("Init State............................");

    super.initState();
    getUserInfo();
    //EditProfilePage('Edit Page').createState().widget;
    //_imagefile=ed.createState().imagepath;
    print('ImageFile:');
    //print(_imagefile);
  }

  Future<Widget> _getImage(BuildContext context,String imageName) async{
    Image image= AssetImage('assets/images/profile.jpg') as Image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image=Image.network(value.toString(),fit: BoxFit.fill,);
    });
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 178, 160, 209),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 110,
            height: 100,
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
            /*decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black38),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: image == "No Image" ? const NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                    : NetworkImage(image),
                  //image:  Gender=='male' ? AssetImage('assets/images/boyDp.jpg') : AssetImage('assets/images/girldp4.jpg'),
                //FileImage(File(_imagefile!.path)),
                  fit: BoxFit.fill),
            ),*/
          ),

          Text(
            "$username",
            //"jokerboy",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "$email",
            //"jokerboy@gmail.com",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context,String Image)async{
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}