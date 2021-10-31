import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:simple_ocr_plugin/simple_ocr_plugin.dart';
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
    String text = "OCR failed to work. Retry with better lighting.";
    try {
      text = await SimpleOcrPlugin.performOCR(file.path);
      print("OCR results => $text");

    } catch(e) {
      print("exception on OCR operation: ${e.toString()}");
    }
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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Text("Take a photo of the supporting document.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black), textAlign: TextAlign.center, ),
                TextField(
                  controller: addresscontroller,
                  minLines: 2,
                  maxLines: 50,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0
                  ),
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      labelText: "Address",
                      labelStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)
                  ),
                ),
                MaterialButton(
                    color: Colors.blue,
                    child: Text("SUBMIT", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white), textAlign: TextAlign.center, ),
                    onPressed: () {
                      log("submitted");
                      }
                    ),
                SizedBox(height: 15,)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
