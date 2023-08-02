import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// flutter run -d chrome --web-renderer html 로 실행
// export FLUTTER_WEB_RENDERER="html" 로 기본 렌더러 변경 가능(CLI에서만 적용)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = '';
  late List _data;
  late TextEditingController _searchEditingController;
  late ScrollController _scrollController;
  int _page = 1;
  
  @override
  void initState() {
    super.initState();
    _data = [];
    _searchEditingController = TextEditingController();
    _scrollController = ScrollController();
    
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getBookData(_page++);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: TextField(
            controller: _searchEditingController,
            decoration: InputDecoration(
              hintText: '검색어를 입력하세요.',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              _page = 1;
              _getBookData(_page);
            },
          )),
      body: Center(
          child: Container(
        child: Center(
            child: _data.length == 0
                ? const Text('데이터가 없습니다.',
                    style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  _data[index]['thumbnail'],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width -
                                              150,
                                      child: Text(
                                        _data[index]['title'].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Text(_data[index]['authors'].toString()),
                                    Text(
                                        _data[index]['sale_price'].toString()),
                                    Text(_data[index]['status'].toString()),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    })),
      ))
    );
  }

  Future<String> _getBookData(int page) async {
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_searchEditingController.text}';
    var response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'KakaoAK fef39cce25ae82cf42ff8300ef5240cc'});

    setState(() {
      print(response.body);
      List result = json.decode(response.body)['documents'];
      if (page == 1) {
        _data.clear();
      }
      _data.addAll(result);
    });
    return response.body;
  }

  @override
  void dispose() {
    _searchEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
