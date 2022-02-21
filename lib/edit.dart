import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/todoform.dart';
import 'todo.dart';
import './tododo.dart';

class EditTodoPage extends StatefulWidget{
  final Todo todo;
  const EditTodoPage({Key? key, required this.todo}): super(key: key);
  @override
  _Edittodo createState() => _Edittodo();

}
class _Edittodo extends State<EditTodoPage>{
  final _formKey= GlobalKey<FormState>();
  String title='';
  String description='';
  @override
  void initState(){
    title=widget.todo.title;
    description=widget.todo.description;
  }
  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(title: Text("Edit task"),actions: [
        IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          const snackBar = SnackBar(
              content: Text('Task Deleted'));
      final provider= Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(widget.todo);
    Navigator.of(context).pop();

    },
  ),
    ]),
      body: Padding(
    padding: EdgeInsets.all(13.0),
      child:
      Form(
      key: _formKey,
      child: TodoFormWidget(
        title: title,
          description: description,
          onChangedTitle: (title)=> setState(() => this.title= title),
          onChangedDescription: (description)=> setState(() => this.description= description),
          onSavedTodo: SaveTodo),
    ),
),
  );

  void SaveTodo() {
    final provider= Provider.of<TodosProvider>(context, listen: false);
    provider.updateTodo(widget.todo, title, description);
    Navigator.of(context).pop();
}
  void DeleteTodo(BuildContext context, Todo todo)
  {
    final provider= Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    const snackBar = SnackBar(
      content: Text('Task Deleted'),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  }
