import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8,8,1,15),
          child: Text(
            login ? "Don’t have an Account ? " : "Already have an Account ? ",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,8,8,15),
            child: Text(
              login ? "Sign Up" : "Sign In",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}