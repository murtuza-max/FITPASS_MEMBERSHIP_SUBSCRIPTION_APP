import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/ProfilePage/QrCodeScanner/screens/createqr.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late double height, width;
  String qrCode = 'Unknown';
  @override
  void initState(){
    super.initState();
    scanQR();
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 60, top: 25, right: 16, bottom: 20),
          child: new Text("Scan QR Code"),
        ),
        //title: Text("Scan QR Code"),
      ),

      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
  SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,58,8,18),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    qrCode = val;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(14),
                    child: Icon(
                      Icons.qr_code_scanner_rounded,
                      color: Colors.deepPurple,
                    ),
                  ),
                  hintText: '$qrCode',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

         SizedBox(height: 12,),

         // scanQR,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(32, 12, 32, 12)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => CreateScreen(),
                ),
              );
            },
            child: Text("Create QR"),
          ),
          SizedBox(width: width),
        ],
      ),
    );
  }

  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        'Purple',
        //'#ff6666',
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
