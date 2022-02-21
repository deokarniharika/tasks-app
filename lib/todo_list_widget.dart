import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/todowidget.dart';
import './todo.dart';
import './tododo.dart';
import './todo_widget_new.dart';

class TodoListWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<TodosProvider>(context);
    final todos=provider.todos;
   return todos.isEmpty?
       Center(
           child: Text("No new tasks")):
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
