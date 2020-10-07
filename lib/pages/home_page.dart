import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage('assets/images/app_bg.png'),
                    colorFilter: ColorFilter.matrix([
                      0.1,
                      0.768,
                      0.189,
                      0.0,
                      0.0,
                      0.1,
                      0.686,
                      0.168,
                      0.0,
                      0.0,
                      0.1,
                      0.534,
                      0.131,
                      0.0,
                      0.0,
                      0.0,
                      0.0,
                      0.0,
                      0.25 ,
                      0.0,
                    ]),
                    fit: BoxFit.cover),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.grey[900]
                    ])),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 50),
                    child: Opacity(
                        opacity: 0.2,
                        child: Transform.scale(
                            scale: 0.5,
                            child: Image.asset(
                              'assets/images/app_logo.png',
                              color: Colors.grey[900],
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 50),
                    child: Opacity(
                        opacity: 1,
                        child: Transform.scale(
                            scale: 0.525,
                            child: Image.asset(
                              'assets/images/app_logo.png',
                              color: Colors.white,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 250.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            onPressed: () {
                              getImageFromGallery();
                            },
                            elevation: 7,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Galeria",
                                    style: TextStyle(
                                        color: Colors.grey[800], fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Icon(
                                      Icons.add_photo_alternate,
                                      color: Colors.grey[800],
                                    ),
                                  )
                                ],
                              ),
                            )),
                        RaisedButton(
                            onPressed: () {
                              getImageFromCamera();
                            },
                            elevation: 7,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "Câmera",
                                  style: TextStyle(
                                      color: Colors.grey[800], fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        //TODO Navigate to recognition screen.
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        //TODO Navigate to recognition screen.
      } else {
        print('No image selected.');
      }
    });
  }
}
