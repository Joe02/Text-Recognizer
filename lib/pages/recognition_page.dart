import 'dart:io';

// import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class RecognitionPage extends StatefulWidget {
  final File image;

  RecognitionPage(this.image);

  @override
  RecognitionPageState createState() => RecognitionPageState();
}

class RecognitionPageState extends State<RecognitionPage> {
  final recognizerController = TextEditingController();
  var recognizedText = "";
  FlutterTts flutterTts = FlutterTts();

  /* ---------- ML VISION ----------*/

  File imageFile;
  FirebaseVisionImage visionImage;

  final TextRecognizer textRecognizer =
      FirebaseVision.instance.textRecognizer();
  final TextRecognizer cloudTextRecognizer =
      FirebaseVision.instance.cloudTextRecognizer();

  VisionText visionText;
  VisionText cloudVisionText;

  /* ---------- -------- ----------*/

  @override
  void initState() {
    super.initState();

    imageFile = widget.image;
    visionImage = FirebaseVisionImage.fromFile(imageFile);

    recognizeText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) =>   Center(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.file(widget.image),
            ),
            if (recognizedText == "")
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircularProgressIndicator(),
              )
            else
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextFormField(
                        maxLines: null,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(),
                        controller: recognizerController,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 20.0, horizontal: 8.0),
                        //   child: GestureDetector(
                        //       onTap: () {
                        //         ClipboardManager.copyToClipBoard(
                        //                 recognizerController.text)
                        //             .then((result) {
                        //           final snackBar = SnackBar(
                        //             content: Text(
                        //                 'Copiado para área de transferência.'),
                        //           );
                        //           Scaffold.of(context).showSnackBar(snackBar);
                        //         });
                        //         ;
                        //       },
                        //       child: Icon(
                        //         Icons.content_copy,
                        //         color: Colors.blue,
                        //       )),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 8.0),
                          child: GestureDetector(
                              onTap: () {
                                speak();
                              },
                              child: Icon(
                                Icons.headset_mic,
                                color: Colors.blue,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              )
          ],
        ))),
      ),
    );
  }

  recognizeText() async {
    visionText = await textRecognizer.processImage((visionImage));
    cloudVisionText = await cloudTextRecognizer.processImage((visionImage));

    setState(() {

      if (visionText.text == "" || visionText.text == null) {
        recognizedText =
            "Erro ao reconhecer elementos textuais na imagem, tente novamente";
        recognizerController.text =
            "Erro ao reconhecer elementos textuais na imagem, tente novamente";
      }

      for (TextBlock block in visionText.blocks) {
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            recognizedText = recognizedText + element.text + " ";
          }
        }
      }

      recognizerController.text = recognizedText;
    });
  }

  @override
  void dispose() {
    super.dispose();
    recognizerController.dispose();
  }

  Future speak() async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.speak(recognizerController.text);
  }
}
