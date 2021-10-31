import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aadhaar address update"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SUCCESS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black), textAlign: TextAlign.center, ),
            SizedBox(height: 20,),
            Text("Address successfully updated.", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25, color: Colors.black), textAlign: TextAlign.center, ),
            SizedBox(height: 10,),
            Icon(Icons.check_circle, color: Colors.green, size: 100,),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
