import 'package:flutter/material.dart';
import 'package:flutter_friendslist/friendlist.dart';

class SecondApp extends StatefulWidget {
  final List<Friend> list;
  const SecondApp({super.key, required this.list});

  @override
  State<SecondApp> createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  final nameController = TextEditingController();
  int radioValue = 0;
  bool moneyrentalpossibility = false;
  var imagePath;
  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return "10년지기친구";
      case 1:
        return "고등학교 동창";
      case 2:
        return "중학교 동창";
    }
  }

  radioChange(int? value) {
    setState(() {
      radioValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Example'),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(children: <Widget>[
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: radioValue,
                  onChanged: radioChange,
                ),
                Text('10년지기'),
                Radio(value: 1, groupValue: radioValue, onChanged: radioChange),
                Text('중학교동창'),
                Radio(value: 2, groupValue: radioValue, onChanged: radioChange),
                Text('고등학교동창'),
              ],
            ),
            Row(
              children: <Widget>[
                Text('돈을 빌려줄 수 있는 친구인가요?'),
                Checkbox(
                    value: moneyrentalpossibility,
                    onChanged: (check) {
                      setState(() {
                        moneyrentalpossibility = check!;
                      });
                    })
              ],
            ),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      'images/image2.png',
                      width: 80,
                    ),
                    onTap: () {
                      imagePath = 'images/image2.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/image1.jpg',
                      width: 80,
                    ),
                    onTap: () {
                      imagePath = 'images/image1.jpg';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/image3.jpg',
                      width: 80,
                    ),
                    onTap: () {
                      imagePath = 'images/image3.jpg';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/image4.png',
                      width: 80,
                    ),
                    onTap: () {
                      imagePath = 'images/image4.png';
                    },
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var friend = Friend(
                  imagePath: imagePath,
                  friendName: nameController.value.text,
                  kind: getKind(radioValue),
                  moneyrentalpossibility: moneyrentalpossibility,
                );
                AlertDialog dialog = AlertDialog(
                  title: Text('친구 추가하기'),
                  content: Text(
                    '이 친구는${friend.friendName} 입니다.'
                    '또 친구의 분류는 ${friend.kind}입니다.\n 이 친구를 추가하시겠습니까?',
                    style: TextStyle(fontSize: 20),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          widget.list.add(friend);
                          Navigator.of(context).pop();
                        },
                        child: Text('예')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('아니요'))
                  ],
                );
                showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog);
              },
              child: Text('친구 추가하기'),
            ),
          ]),
        ),
      ),
    );
  }
}
