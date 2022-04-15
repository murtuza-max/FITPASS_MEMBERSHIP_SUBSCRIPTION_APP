
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class GetUserName extends StatelessWidget {
  //final String documentId;

  User? user = FirebaseAuth.instance.currentUser;
  //GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Signupdata');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                      "UserName: ${data['Username']}";
                      "Email: ${data['Email']}";
        }

        return Text("loading");
      },
    );
  }
}