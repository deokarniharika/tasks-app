import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './todo_widget_new.dart';
import './tododo.dart';

class DeletedRecents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<TodosProvider>(context);
    final todos=provider.todosCompleted;
    return todos.isEmpty?
    Center(
        child: Text("No completed tasks")):
    ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12.0),
        itemCount: todos.length,
        separatorBuilder: (context, index)=> Container(height: 12),
        itemBuilder: (context, index)
        {
          final todo= todos[index];
          return TodoWidget(todo: todo);

        });
  }
}