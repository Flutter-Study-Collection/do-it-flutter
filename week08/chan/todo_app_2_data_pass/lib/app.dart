import 'package:flutter/material.dart';
import 'package:navigaton/ui/first_page.dart';
import 'package:navigaton/ui/second_page.dart';
import 'package:navigaton/ui/third_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home 대신에 initialRoute를 사용합니다.
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/third': (context) => const ThirdPage(),
      }
    );
  }
}