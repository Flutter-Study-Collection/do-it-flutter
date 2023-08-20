import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstTab extends StatefulWidget {
  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  List<String> accessLogs = [];

  @override
  void initState() {
    super.initState();
  
    addAccessLog();
   
    fetchAccessLogs();
  }

  Future<void> addAccessLog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    String accessLog = 'App 접속 시각: $formattedDate';

    List<String> logs = prefs.getStringList('accessLogs') ?? [];
    logs.add(accessLog);
    await prefs.setStringList('accessLogs', logs);
  }

  Future<void> fetchAccessLogs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedLogs = prefs.getStringList('accessLogs') ?? [];
    setState(() {
      accessLogs = storedLogs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Access Log Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('앱에 접속했습니다.'),
            SizedBox(height: 20),
            Text('접속 로그:'),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: accessLogs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(accessLogs[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
