import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(title: Text('Third Page')),
        body: Container(
            child: Center(
                child: Text(args,
                    style: TextStyle(fontSize: 30))
            )
        )
    );
  }
}
