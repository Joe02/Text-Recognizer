import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.center,
            image: AssetImage('assets/images/app_background.png'),
            colorFilter: ColorFilter.matrix([
              0.393, 0.768, 0.189, 0.0, 0.0,
              0.349, 0.686, 0.168, 0.0, 0.0,
              0.272, 0.534, 0.131, 0.0, 0.0,
              0.0, 0.0, 0.0, 0.2, 0.0,]),
            fit: BoxFit.cover
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.amberAccent,
              Colors.orange,
              Colors.orange,
            ]
          )
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 100),
                child: Opacity(
                    opacity: 1,
                    child: Transform.scale(
                        scale: 0.5,
                        child: Image.asset('assets/images/app_logo.png'))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: () {
                          //TODO Open camera for recognition.
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Adicionar",
                              style: TextStyle(color: Colors.amber[500], fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Icon(
                                Icons.add_photo_alternate,
                                color: Colors.amber[500],
                              ),
                            )
                          ],
                        )),
                    RaisedButton(
                        onPressed: () {
                          //TODO Navigate to Login Page
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 17.5),
                              child: Text(
                                "Login",
                                style:
                                    TextStyle(color: Colors.amber[500], fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0, right: 15),
                              child: Icon(
                                Icons.portrait,
                                color: Colors.amber[500],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
