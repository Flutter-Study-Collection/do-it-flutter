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
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
                child: InkWell(
                    child: Text(
                      todoList[index],
                      style: TextStyle(fontSize: 30),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/third', arguments: todoList[index]);
                    }));
          },
          itemCount: todoList.length),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            _addNavigation(context);
          }),
    );
  }

  void _addNavigation(BuildContext context) async {
    print("PUSH!!!");
    // push이후에 Object 반환값을 받을 수 있습니다.
    final result = await Navigator.of(context).pushNamed('/second');
    print("POP!!!");
    print("result $result");
    setState(() {
      print(result.toString());
      todoList.add(result.toString()); // 반환값을 String으로 변환 후 리스트에 추가합니다.
    });
  }
}
