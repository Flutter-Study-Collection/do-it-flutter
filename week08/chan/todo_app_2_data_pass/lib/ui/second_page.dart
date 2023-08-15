import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Container(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                child: Text('저장하기'),
                onPressed: () {
                  print("value ${_textEditingController.value}");
                  print("value.text ${_textEditingController.value.text}");
                  print("text ${_textEditingController.text}");
                  Navigator.of(context).pop(_textEditingController.value.text);
                },
              ),
            ],
          )
        )
      )
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
