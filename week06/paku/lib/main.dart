import 'package:flutter/material.dart';
import 'package:flutter_friendslist/sub/firstpage.dart';
import 'package:flutter_friendslist/sub/secondpage.dart';
import "package:flutter_friendslist/cupertinoMain.dart";
import 'friendlist.dart';

void main() {
  runApp(CupertinoMain());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Friend> friendlist = [];

  @override
  void initState() {
    super.initState;
    controller = TabController(length: 2, vsync: this);
    friendlist.add(Friend(
        imagePath: 'images/image1.jpg',
        kind: '10년지기',
        friendName: '김경연',
        moneyrentalpossibility: true));
    friendlist.add(Friend(
        imagePath: 'images/image2.png',
        kind: '중학교동창',
        friendName: '서현석',
        moneyrentalpossibility: true));
    friendlist.add(Friend(
        imagePath: 'images/image3.jpg',
        kind: '고등학교동창',
        friendName: '고현우',
        moneyrentalpossibility: true));
    friendlist.add(Friend(
        imagePath: 'images/image4.png',
        kind: '고등학교동창',
        friendName: '이한민',
        moneyrentalpossibility: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: TabBarView(controller: controller, children: <Widget>[
        FirstApp(list: friendlist),
        SecondApp(list: friendlist)
      ]),
      bottomNavigationBar: TabBar(
        tabs: const <Tab>[
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.amber,
            ),
          )
        ],
        controller: controller,
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
