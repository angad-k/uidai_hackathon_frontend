import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:tesseract_ocr/tesseract_ocr.dart';
import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
class DocumentPhotosScreen extends StatefulWidget {
  @override
  _DocumentPhotosScreenState createState() => _DocumentPhotosScreenState();
}

class _DocumentPhotosScreenState extends State<DocumentPhotosScreen> {
  final photos = <File>[];
  final addresscontroller = TextEditingController();
  void openCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
              onFile: (file) {
                photos.add(file);
                Navigator.pop(context);
                getText(file);
                setState(() {});
              },
            )));
  }
  Future<String> getText(File file) async {
    String text = await TesseractOcr.extractText(file.path, language: 'eng');
    addresscontroller.text = text;
    return text;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aadhaar address update"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: addresscontroller,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0
              ),
              decoration: InputDecoration(
                  fillColor: Colors.grey,
                  labelText: "Address",
                  labelStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
