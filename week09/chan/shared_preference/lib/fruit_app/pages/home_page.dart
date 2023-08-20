import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fruits = [];

  _loadData() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = await File('${dir.path}/fruits.txt');

      if(await file.exists() == false) {
        final defaultFruitsFromAsset = await DefaultAssetBundle.of(context).loadString('repo/fruit.txt');
        file.writeAsStringSync(defaultFruitsFromAsset);
      }

      setState(() {
        fruits = file.readAsStringSync().split('\n');
      });
    } catch(e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    print('initState');
    super.initState();
    _loadData();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fruits[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_fruit').then((value) {
            _loadData();
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
