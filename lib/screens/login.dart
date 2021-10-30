import 'dart:developer';
import 'package:uidai_frontend/screens/otp.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aadhaar address update"),
      ),
      body: Center(
        child: LogIn(),
      ),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  String errorMsg = "";
  Widget build(BuildContext context) {
    final aadhaarPhoneController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("LOG IN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black), textAlign: TextAlign.center, ),
          SizedBox(height: 20,),
          Container(
            width: size.width * 0.8,
            child: TextField(
              controller: aadhaarPhoneController,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0
              ),
              decoration: InputDecoration(
                  fillColor: Colors.grey,
                  labelText: "Aadhaar no. / mobile",
                  labelStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(errorMsg, style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.w600),),
          SizedBox(height: 20,),
          MaterialButton(
            color: Colors.blue,
            child: Text("SUBMIT", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black), textAlign: TextAlign.center, ),
            onPressed: () {
              if(aadhaarPhoneController.text.length == 10 || aadhaarPhoneController.text.length == 12)
                {
                  log(aadhaarPhoneController.text);
                  setState(() {
                    errorMsg = "";
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(aadhaarPhone: aadhaarPhoneController.text)));
                }
              else
                {
                  setState(() {
                    errorMsg = "Please enter valid mobile or Aadhaar number.";
                  });
                }
            }),
          SizedBox(height: 30,),
        ],

      ),
    );
  }
}
