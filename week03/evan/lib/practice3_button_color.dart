import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  String test = 'Hello';
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
          body: Center(
              child: ElevatedButton(
                  child: Text('$test'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_color)
                  ),
                  onPressed: () {
                    if(_color == Colors.blue) {
                      setState(() {
                        test = 'Flutter';
                        _color = Colors.amber;
                      });
                    } else {
                      setState(() {
                        test = 'Hello';
                        _color = Colors.blue;
                      });
                    }
                  }))),
    );
  }
}
