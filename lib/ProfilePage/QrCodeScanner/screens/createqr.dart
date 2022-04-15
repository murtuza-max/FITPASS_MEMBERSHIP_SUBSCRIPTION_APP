import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/ProfilePage/QrCodeScanner/screens/scanqr.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  String qrString = "Add Data";
  String qrCode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 52, top: 25, right: 16, bottom: 20),
          child: new Text("Create QR Code"),
        ),
        //title: Text("Create QR Code"),
      ),


      body: Container(
        //   key: _formKey,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          // qr code
          SizedBox(
            height: 50,
          ),
          BarcodeWidget(
            color: Colors.deepPurpleAccent,
            data: qrString,
            height: 280,
            width: 280,
            barcode: Barcode.qrCode(),
          ),
          // link
          SizedBox(
            height: 60,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: TextField(
              onChanged: (val) {
                setState(() {
                  qrString = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter you data here",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(57, 18, 57, 18)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ScanScreen(),
                    ),
                  );
                },
                child: Text("Scan QR"),
              ),
            ],
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
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
