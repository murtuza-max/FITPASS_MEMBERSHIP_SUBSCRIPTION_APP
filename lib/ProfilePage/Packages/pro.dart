import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pro extends StatefulWidget {
  const Pro({Key? key}) : super(key: key);

  @override
  _ProState createState() => _ProState();
}

class _ProState extends State<Pro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 161, 134, 233),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(45, 12, 15, 12),
          child: Text("PRO FITPASS"),
        ),
        //title: Text("PRO MEMBERSHIP"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/prosc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(32),
          child: RaisedButton(
            onPressed: () => Fluttertoast.showToast(
              msg: 'Purchase Successful',
              fontSize: 18,
            ),
            color: Color.fromARGB(255, 146, 117, 226),
            padding: EdgeInsets.fromLTRB(112, 10, 112, 15),
            child: Text(
              'Buy Now',
              style: TextStyle(
                  fontSize: 14, letterSpacing: 2.2, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
