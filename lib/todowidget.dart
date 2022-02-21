import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './todoform.dart';
import './tododo.dart';
import './todo.dart';

class Todo_dialog_Widget extends StatefulWidget {
  @override
  _MyBottomHomeAppState createState() => _MyBottomHomeAppState();
}

class _MyBottomHomeAppState extends State<Todo_dialog_Widget> {
  final _formKey= GlobalKey<FormState>();
  String title= '';
  String description= '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add new task",
            style: TextStyle(
            fontWeight: FontWeight.bold,
              fontSize: 22,
            )),
            TodoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) => setState(() => this.description = description),
                onSavedTodo: addTodo, ),
          ]

        ),
      ),
    )
  );

  
void addTodo() {
    final todo = Todo(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      createdTime: DateTime.now(),
    );

    final provider= Provider.of<TodosProvider>(context, listen: false);
    provider.addTodo(todo);
    Navigator.of(context).pop();
}
}
