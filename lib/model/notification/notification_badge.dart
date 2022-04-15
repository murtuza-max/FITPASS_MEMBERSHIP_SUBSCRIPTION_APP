//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final int counter;
  NotificationBadge({required this.counter});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "$counter",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
