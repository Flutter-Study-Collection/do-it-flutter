import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_friendslist/friendlist.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, @required this.friendList}) : super(key: key);
  final List<Friend>? friendList;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('친구리스트')),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(5),
              height: 150,
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(friendList![index].imagePath,
                        fit: BoxFit.contain, height: 90, width: 100),
                    Text(friendList![index].friendName)
                  ],
                ),
                Container(
                  height: 2,
                  color: CupertinoColors.black,
                )
              ]),
            );
          },
          itemCount: friendList!.length,
        ));
  }
}
