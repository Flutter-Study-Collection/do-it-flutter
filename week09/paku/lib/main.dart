import 'package:flutter/material.dart';
import 'package:helloworld/tabclass/thirdtab.dart';
import 'package:helloworld/tabclass/secondtab.dart';
import 'tabclass/firsttab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    FirstTab(),
    SecondTab(),
    ThirdTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Example'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '첫 번째 탭',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '두 번째 탭',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '세 번째 탭',
          ),
        ],
      ),
    );
  }
}

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThirdTabPage();
  }
}
