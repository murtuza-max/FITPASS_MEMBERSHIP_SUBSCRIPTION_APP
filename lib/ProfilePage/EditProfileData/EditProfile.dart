import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/ProfilePage/my_drawer_header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';


final String title = "Edit Profile";

class EditProfilePage extends StatefulWidget {
  EditProfilePage(title);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  String email = ""; //murtaza@gmail.com
  String username = ""; //murtaza
  var password = ""; //murtaza
  String downloadURL="";
  var imagepath;
  PickedFile ? _imagefile;
  final ImagePicker _picker = ImagePicker();
  //File ? image;
  var image="";
  File ? imageFile;
  bool showLocalFile = false;
  String validateurl='';
  bool showPassword = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  CollectionReference _collref = FirebaseFirestore.instance.collection('SignUpUser');
  var picselect=0;
  void getUserInfo() async {
    final uid = await FirebaseAuth.instance.currentUser!.uid;
    final _doc = await _collref.doc(uid).get();
    //final _img = await _collref.doc(uid).collection("images").doc(uid).get();

    print("UID : ");
    print(uid);

    setState(() {
      username = _doc['Username'];
      email = _doc['Email'];
      password = _doc['password'];
      image = _doc['downloadUrl'];
      print("Setstate:.....................");

    });

    print("Username : ");
    print(username);

    print("Email : ");
    print(email);
    print("retrived Image Url : ");
    print(image);
  }

  @override
  void initState() {
    print("Init State............................");

    //this.imagetempory = File(_imagefile!.path);

    super.initState();
    getUserInfo();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    usernameController = new TextEditingController();
    imagepath=_imagefile;

  }

  Widget bottomSheet(context){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text('choose Profile Photo',
          style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton.icon(onPressed: (){ _pickImageFromCamera();/*pickImage(ImageSource.camera);*/}, icon: Icon(Icons.camera), label: Text('Camera')),
            FlatButton.icon(onPressed: (){_pickImageFromGallery();/*pickImage(ImageSource.gallery);*/}, icon: Icon(Icons.image), label: Text('Gallery'))
          ],
          ),
        ],
      ),
    );
  }
/////////////////////////////////

  _pickImageFromGallery() async {

    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if( xFile == null ) return;
    final imagePermanant = await saveImagePermanently(xFile.path);
    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {
      picselect=1;
      this.imageFile = imagePermanant;
    });
  }

  _pickImageFromCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if( xFile == null ) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    final imagePermanant = await saveImagePermanently(xFile.path);
    setState(() {
      picselect=1;
      this.imageFile = imagePermanant;
    });
  }
  //////////////////////////
  Future uploadImage(userid) async{
    String usrId=userid;
    FirebaseFirestore fs = FirebaseFirestore.instance;
    final postID= usrId.toString();
    Reference ref = FirebaseStorage.instance.ref().child("${usrId}/images").child("post_$postID");
    await ref.putFile(imageFile!);
    downloadURL = await ref.getDownloadURL();
    print('downloadURL:');
    print(downloadURL);
    await fs.collection('SignUpUser').doc(usrId).update({'downloadUrl' : downloadURL});
  }

Future pickImage(ImageSource source) async{
    try {
      final imagep = await ImagePicker().pickImage(source: source);
      if (imagep == null) return;
      final imagePermanant = await saveImagePermanently(imagep.path);
      setState(() {
        this.imageFile = imagePermanant;
      });
    }on PlatformException catch(e){
      print('Failed to pick image : $e');
    }
}
  void takePhoto(ImageSource source) async{

    final pickedFile = await _picker.getImage(source: source);
    final imagePermanant = await saveImagePermanently(pickedFile!.path);
    setState(() {
      _imagefile = pickedFile;
      this.imageFile=imagePermanant;
    });
  }

  Future<File> saveImagePermanently(String imagepath) async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagepath);
    final imagec = File('${directory.path}/$name');
    return File(imagepath).copy(imagec.path);

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
                height: 15,
              ),
              Center(
                child: Stack(
                  children:<Widget>[

                    CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.deepPurple[200],

                        backgroundImage: showLocalFile ? FileImage(imageFile!) as ImageProvider :
                        image == "No Image" ? const NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                            : NetworkImage(image)
                        ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2),
                            color: Colors.deepPurple),
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: ((builder) => bottomSheet(context)));
                          },
                            child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Username",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$username",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    onChanged: (value) {
                      username = value;

                      print('username updated :');
                      print(username);
                    }),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Email",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$email",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    onChanged: (value) {
                      email = value;
                      print('email updated :');
                      print(email);
                    }),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                    obscureText: true ? showPassword : false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 13),
                      labelText: "Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "$password",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
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
                    ),
                    onChanged: (value) {
                      password = value;
                      print('password updated :');
                      print(password);
                    }),
              ),
              SizedBox(
                height: 75,
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
                    onPressed: () async{

                      String usr = FirebaseAuth.instance.currentUser!.uid;
                      //FirebaseFirestore fs = FirebaseFirestore.instance;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.deepPurpleAccent[100],
                          content: Text(
                            "Saving...",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      );
                      if(picselect==1) {
                        final postID = usr.toString();
                        Reference ref = FirebaseStorage.instance.ref().child(
                            "${usr}/images").child("post_$postID");
                        await ref.putFile(imageFile!);
                        image = await ref.getDownloadURL();
                        print('downloadURL:');
                        print(image);
                      }
                      //uploadImage(usr);
                      _collref.doc(usr).update({
                        'Username': username,
                        'Email': email,
                        'password': password,
                        'downloadUrl' : image,

                      }).then((value) {
                        print('user data updated');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.greenAccent,
                            content: Text(
                              "Profile Data Updated Successfully.",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ); //Navigator.pop(context);
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
