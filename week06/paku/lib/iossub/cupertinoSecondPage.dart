import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_friendslist/friendlist.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, this.friendList}) : super(key: key);
  final List<Friend>? friendList;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController? _textController;
  int _kindChoice = 0;
  bool moneyrentalpossibility = false;
  String? _imagePath;
  Map<int, Widget> segmentWidgets = {
    0: SizedBox(child: Text('10년지기친구', textAlign: TextAlign.center), width: 80),
    1: SizedBox(child: Text('중학교 동창', textAlign: TextAlign.center), width: 80),
    2: SizedBox(child: Text('고등학교 동창', textAlign: TextAlign.center), width: 80)
  };

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('친구추가')),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(100),
                child: CupertinoTextField(
                  controller: _textController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
              ),
              CupertinoSegmentedControl(
                  groupValue: _kindChoice,
                  children: segmentWidgets,
                  onValueChanged: (value) {
                    setState(() {
                      _kindChoice = value;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('돈을 빌려줄 수 있는 친구입니까?'),
                  CupertinoSwitch(
                    value: moneyrentalpossibility,
                    onChanged: ((value) => setState(() {
                          moneyrentalpossibility = value;
                        })),
                  )
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  padding: EdgeInsets.only(left: 350),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'images/image1.jpg',
                        width: 80,
                      ),
                      onTap: () {
                        _imagePath = 'images/image2.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'images/image2.png',
                        width: 80,
                      ),
                      onTap: () {
                        _imagePath = 'images/image2.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'images/image3.jpg',
                        width: 80,
                      ),
                      onTap: () {
                        _imagePath = 'images/image2.png';
                      },
                    )
                  ],
                ),
              ),
              CupertinoButton(
                  child: Text('친구추가하기'),
                  onPressed: () {
                    widget.friendList!.add(Friend(
                        friendName: _textController!.value.text,
                        kind: getKind(_kindChoice),
                        imagePath: _imagePath!,
                        moneyrentalpossibility: moneyrentalpossibility));
                  })
            ],
          ),
        ),
      ),
    );
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return '10년지기친구';
      case 1:
        return '중학교동창';
      case 2:
        return '고등학교 동창';
    }
  }
}
