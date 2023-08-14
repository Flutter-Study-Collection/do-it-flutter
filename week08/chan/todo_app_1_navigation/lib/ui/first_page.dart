import 'package:flutter/material.dart';
import 'package:navigaton/ui/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: Text('두 번째 페이지로 이동하기')
          )
        )
      )
    );
  }
}
