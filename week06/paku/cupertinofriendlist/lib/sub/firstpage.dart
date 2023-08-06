import 'package:flutter/material.dart';
import 'package:flutter_friendslist/friendlist.dart';

class FirstApp extends StatelessWidget {
  final List<Friend> list;
  const FirstApp({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Example'),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return GestureDetector(
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(list[position].friendName)
                    ],
                  ),
                ),
                onTap: () {
                  AlertDialog dialog = AlertDialog(
                    content: Text('이 친구는 ${list[position].kind}입니다.',
                        style: const TextStyle(fontSize: 30)),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog);
                },
              );
            },
            itemCount: list.length,
          ),
        ),
      ),
    );
  }
}
