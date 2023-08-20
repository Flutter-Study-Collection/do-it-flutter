import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThirdTabPage extends StatefulWidget {
  const ThirdTabPage({Key? key}) : super(key: key);

  @override
  State<ThirdTabPage> createState() => _ThirdTabPageState();
}

class _ThirdTabPageState extends State<ThirdTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold with Navigation Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
          child: Text('다른 화면으로 이동'),
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    getInitData();
  }

  Future<void> getInitData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedValue1 = prefs.getString('keyForValue1') ?? '';
    String savedValue2 = prefs.getString('keyForValue2') ?? '';

    setState(() {
      textField1Controller.text = savedValue1;
      textField2Controller.text = savedValue2;
    });
  }

  Future<void> _saveButtonPressed() async {
    String value1 = textField1Controller.text;
    String value2 = textField2Controller.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('keyForValue1', value1);
    await prefs.setString('keyForValue2', value2);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('값이 저장되었습니다.')),
    );
  }

  @override
  void dispose() {
    textField1Controller.dispose();
    textField2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFields Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textField1Controller,
              decoration: InputDecoration(labelText: 'Text Field 1'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: textField2Controller,
              decoration: InputDecoration(labelText: 'Text Field 2'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveButtonPressed,
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
