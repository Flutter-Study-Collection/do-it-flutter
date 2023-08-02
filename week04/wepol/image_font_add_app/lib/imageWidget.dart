import 'package:flutter/material.dart';

class ImageWidgetApp extends StatefulWidget {
  const ImageWidgetApp({super.key});

  @override
  State<ImageWidgetApp> createState() => _ImageWidgetApp();
}

class _ImageWidgetApp extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Widget'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('image/flutter_logo.png',
                  width: 100, height: 100, fit: BoxFit.fill),
              Text(
                'Hello Flutter',
                style: TextStyle(
                    fontFamily: 'Pacifico', fontSize: 30, color: Colors.amber),
              )
            ],
          ),
        ),
      ),
    );
  }
}
