import 'dart:developer';
import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({Key? key, required this.operatorAadhar}) : super(key: key);
  final String operatorAadhar;
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gathering Data"),
      ),
    );
  }
}
