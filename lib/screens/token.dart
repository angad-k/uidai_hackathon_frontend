import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:uidai_frontend/screens/scan.dart';

class TokenScreen extends StatefulWidget {
  TokenScreen({Key? key, required this.operatorAadhar}) : super(key: key);
  final String operatorAadhar;
  @override
  _TokenScreenState createState() => _TokenScreenState();
}

class _TokenScreenState extends State<TokenScreen> {
  final token = TextEditingController();
  var data = ["", ""];
  String errorMsg = "";
  String residentName = "";
  String residentAddress = "";
  bool isContinueButtonDisabled = false;
  @override
  Widget build(BuildContext context) {
    log(widget.operatorAadhar.toString());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Resident Token"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please enter resident\'s token',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              child: TextField(
                controller: token,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    labelText: "Resident's Token",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              errorMsg,
              style: TextStyle(
                  color: Colors.red, fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  "Preview",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  if (int.parse(token.text) == 1234) {
                    isContinueButtonDisabled = true;
                    //Test token is 1234
                    data[0] = "Dummy Name";
                    data[1] = "Dummy Address"; // Need to fetch data using API
                    setState(() {
                      errorMsg = "";
                      residentName = data[0];
                      residentAddress = data[1];
                    });
                  } else {
                    setState(() {
                      errorMsg = "Please enter a valid token.";
                    });
                  }
                }),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width * 0.8,
              child: Text(
                'Name: ' + data[0],
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              child: Text(
                'Address: ' + data[1],
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.blue,
                child: Text(
                  isContinueButtonDisabled ? "Continue" : "",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                onPressed: isContinueButtonDisabled
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScanScreen(
                                    operatorAadhar: widget.operatorAadhar)));
                      }
                    : null),
          ],
        ),
      ),
    );
  }
}
