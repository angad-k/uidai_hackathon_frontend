import 'dart:developer';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key, required this.aadhaarPhone}) : super(key: key);
  final String aadhaarPhone;
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    log(widget.aadhaarPhone);
    Size size = MediaQuery.of(context).size;
    String obfuscatedPhone = widget.aadhaarPhone.replaceRange(0, 8, "********");
    String otpSentText = "";
    if(obfuscatedPhone.length == 10)
      {
        otpSentText = "OTP sent to " + obfuscatedPhone;
      }
    else
      {
        otpSentText = "OTP sent to registered mobile no. for aadhar no. : " + obfuscatedPhone;
      }

    return Scaffold(
      appBar: AppBar(
        title: Text("Aadhaar address update"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(otpSentText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black), textAlign: TextAlign.center, ),
            SizedBox(height: 20,),
            Container(
              width: size.width*0.8,
              child : OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width*0.5,
                fieldWidth: 50,
                style: TextStyle(
                    fontSize: 17
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
                onChanged: (s) {
                  //do nothing for now, put this here kyuki otherwise otp wala widget ro deta hai.
                },
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

