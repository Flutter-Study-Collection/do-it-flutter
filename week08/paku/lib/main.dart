import 'package:flutter/material.dart';
import 'package:todolist/pages/firstpage.dart';
import 'package:todolist/pages/secondpage.dart';

void main() {
  runApp(MyApp());
}

class TodoItem {
  final String todo;
  bool isCompleted;

  TodoItem(this.todo, this.isCompleted);
}

class TodoList {
  List<TodoItem> items = [];
}

class MyApp extends StatelessWidget {
  final TodoList todoList = TodoList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(todoList),
    );
  }
}

class MainScreen extends StatefulWidget {
  final TodoList todoList;

  MainScreen(this.todoList);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      AddTodoPage(widget.todoList),
      TodoListPage(widget.todoList),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        title: Text('Todo'),
        leading: Icon(Icons.list),
        backgroundColor: Colors.orange,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
      ),
    );
  }
}
