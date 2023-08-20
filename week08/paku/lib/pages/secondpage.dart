import 'package:flutter/material.dart';
import 'package:todolist/main.dart';

class TodoListPage extends StatelessWidget {
  final TodoList todoList;

  TodoListPage(this.todoList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: todoList.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoList.items[index].todo),
            leading: Checkbox(
              value: todoList.items[index].isCompleted,
              onChanged: (value) {},
            ),
          );
        },
      ),
    );
  }
}
