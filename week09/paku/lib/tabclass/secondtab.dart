import 'package:flutter/material.dart';

class SecondTab extends StatefulWidget {
  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  int count = 1;
  bool increaseCounting = true;

  @override
  void initState() {
    super.initState();
    startCounting();
  }

  void startCounting() {
    Future.delayed(Duration(seconds: 1), () {
      if (increaseCounting) {
        setState(() {
          count = (count % 10) + 1;
        });
        startCounting();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('카운트: $count'),
          ElevatedButton(
            onPressed: () {
              increaseCounting = !increaseCounting;
              if (increaseCounting) {
                startCounting();
              }
            },
            child: Text(increaseCounting ? '정지' : '시작'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    increaseCounting = false;
    super.dispose();
  }
}
