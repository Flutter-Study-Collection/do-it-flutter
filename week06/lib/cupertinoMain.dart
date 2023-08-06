import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_friendslist/friendlist.dart';
import 'package:flutter_friendslist/iossub/cupertinoSecondPage.dart';
import 'iossub/cupertinoFirstPage.dart';

class CupertinoMain extends StatefulWidget {
  const CupertinoMain({super.key});

  @override
  State<CupertinoMain> createState() => _CupertinoMainState();
}

class _CupertinoMainState extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;
  List<Friend> friendlist = [];
  @override
  void initState() {
    // TODO: implement initState

    tabBar = CupertinoTabBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add))
    ]);
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
    return CupertinoApp(
        home: CupertinoTabScaffold(
            tabBar: tabBar!,
            tabBuilder: (context, value) {
              if (value == 0) {
                return FirstPage(
                  friendList: friendlist,
                );
              } else {
                return SecondPage(
                  friendList: friendlist,
                );
              }
            }));
  }
}
