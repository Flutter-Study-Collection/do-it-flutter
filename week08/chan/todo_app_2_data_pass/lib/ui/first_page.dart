import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add('푸시업 30회 하기');
    todoList.add('플러터 8강 끝내기');
    todoList.add('riverpod 공부하기');
    todoList.add('플러터 9강 과제 업로드 하기');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('First Page')),
        body: ListView.builder(itemBuilder: (context, index) {
          return Card(
              child: InkWell(
                  child: Text(
                    todoList[index],
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/second', arguments: todoList[index]);
                  }));
        },
        itemCount: todoList.length), floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {

      }
    ),);
  }
}
