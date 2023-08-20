import 'package:flutter/material.dart';
import 'package:todolist/main.dart';

class AddTodoPage extends StatelessWidget {
  final TodoList todoList;

  AddTodoPage(this.todoList);

  @override
  Widget build(BuildContext context) {
    TextEditingController todoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 100, left: 80, right: 80),
              child: TextField(
                  decoration: InputDecoration(hintText: '할일추가하기'),
                  controller: todoController)),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              String todo = todoController.text;
              if (todo.isNotEmpty) {
                todoList.items.add(TodoItem(todo, false));
                todoController.clear();
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
