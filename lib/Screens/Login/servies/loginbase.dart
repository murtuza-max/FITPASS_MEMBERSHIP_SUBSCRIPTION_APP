

import 'package:firebase_auth/firebase_auth.dart';

//BuildContext context;

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
