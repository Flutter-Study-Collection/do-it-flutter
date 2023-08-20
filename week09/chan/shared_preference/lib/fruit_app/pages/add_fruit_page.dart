import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AddFruitPage extends StatefulWidget {
  const AddFruitPage({super.key});

  @override
  State<AddFruitPage> createState() => _AddFruitPageState();
}

class _AddFruitPageState extends State<AddFruitPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  _setData({required String fruitName}) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/fruits.txt');
      final content = await file.readAsString();
      file.writeAsString('$content\n$fruitName');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '과일 이름',
              )
            ),
            ElevatedButton(
                onPressed: () async {
                  await _setData(fruitName: _controller.text);
                  Navigator.pop(context);
                },
                child: Text('추가'))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
