import 'package:flutter/material.dart';

class firstApp extends StatelessWidget {
  const firstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('첫번째 페이지'),
        ),
      ),
    );
  }
}
