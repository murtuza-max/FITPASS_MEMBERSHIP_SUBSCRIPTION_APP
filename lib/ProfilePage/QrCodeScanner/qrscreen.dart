import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/ProfilePage/QrCodeScanner/screens/createqr.dart';
import 'package:flutter_auth/ProfilePage/QrCodeScanner/screens/scanqr.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

final String title = "Bar Code ";

class QrScreen extends StatefulWidget {
  QrScreen(title);

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  String qrCode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 74, top: 25, right: 16, bottom: 20),
          child: new Text(title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(32, 12, 32, 12)),
              onPressed: () {
                print("tapped on create QR button.");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CreateScreen(),
                  ),
                );
              },
              child: Text("Create QR"),
            ),
            SizedBox(height: 190,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "STATUS : ",
                    //qrString,
                    style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 30),
                  ),
                  Text(
                    '$qrCode',
                    //qrString,
                    style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 30),
                  ),
                ]

            ),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(37, 12, 37, 12)),
              onPressed: scanQR,

              child: Text("Scan QR"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
