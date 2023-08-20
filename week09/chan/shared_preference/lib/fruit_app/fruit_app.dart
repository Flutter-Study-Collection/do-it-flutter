
import 'package:flutter/material.dart';
import 'package:shared_preference/fruit_app/pages/add_fruit_page.dart';
import 'package:shared_preference/fruit_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

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
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/add_fruit': (context) => const AddFruitPage(),
      },
    );
  }
}