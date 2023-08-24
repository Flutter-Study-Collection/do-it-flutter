import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: BookSearchScreen(),
  ));
}

class BookSearchScreen extends StatefulWidget {
  @override
  _BookSearchScreenState createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  ScrollController _scrollController = ScrollController(); // 스크롤 컨트롤러 생성
  int page = 1;
  TextEditingController _searchController = TextEditingController();
  List<Book> _searchResults = [];
  bool _isLoading = false;
  bool _isLoadingNextPage = false;

  Future<void> _searchBooks(String query, int page, int size) async {
    final apiKey = 'abcfce7597ad63b99993b60327401dbe'; // 카카오 API 키 입력
    final apiUrl = 'https://dapi.kakao.com/v3/search/book';

    final response = await http.get(
      Uri.parse('$apiUrl?query=$query&page$page&size=$size'),
      headers: {
        'Authorization': 'KakaoAK $apiKey',
      },
    );
    @override
    void initState() {
      super.initState();
      _scrollController.addListener(_scrollListener());
    }

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<Book> books = [];

      for (var item in jsonData['documents']) {
        books.add(Book.fromJson(item));
      }
      setState(() {
        _searchResults.addAll(books);
      });
      _isLoading = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 스크롤 컨트롤러 해제
    super.dispose();
  }

  Future<void> _loadNextPage() async {
    if (!_isLoadingNextPage) {
      setState(() {
        _isLoadingNextPage = true;
      });
      await _searchBooks(_searchController.text, page + 1, 5);
      setState(() {
        _isLoadingNextPage = false;
      });
    }
  }

  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!_isLoading) {
        _isLoading = true;
        page++;
        _searchBooks(_searchController.text, page, 5);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter book title',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchBooks(_searchController.text, page, 5);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _searchResults.length + 1,
              itemBuilder: (context, index) {
                if (index < _searchResults.length) {
                  return ListTile(
                    title: Text(_searchResults[index].title),
                    subtitle: Text(_searchResults[index].author),
                    leading: Image.network(_searchResults[index].thumbnailUrl,
                        width: 50, height: 50, fit: BoxFit.cover),
                  );
                } else if (_isLoadingNextPage) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      _loadNextPage(); // Call function to load next page
                    },
                    child: Text('Load Next Page'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String thumbnailUrl;
  Book({required this.title, required this.author, required this.thumbnailUrl});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'],
        author: json['authors'] != null ? json['authors'][0] : 'Unknown Author',
        thumbnailUrl: json['thumbnail']);
  }
}
