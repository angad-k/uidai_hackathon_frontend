import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGen extends StatelessWidget {
  QRCodeGen(this.message, this.data);
  final String data; //data for QR code
  final String message; //message to be shown on the top
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aadhaar address update"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black), textAlign: TextAlign.center, ),
                SizedBox(height: 20,),
                QrImage(
                  data: data,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ],
          ),
        ),
      ),
    );
  }
}
