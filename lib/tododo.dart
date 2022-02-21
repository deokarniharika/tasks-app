import 'package:flutter/material.dart';
import './todo.dart';

class TodosProvider extends ChangeNotifier{
List<Todo> _todos= [
  ];
//List<Todo> get todos=> _todos.toList();
List<Todo> get todos=> _todos.where((todo)=> todo.isDone== false).toList();
List<Todo> get todosCompleted=> _todos.where((todo) => todo.isDone== true).toList();

void addTodo(Todo todo)
{
  _todos.add(todo);
  notifyListeners();
}
void removeTodo(Todo todo)
{
  _todos.remove(todo);
  notifyListeners();
}
void toggleTodoStatus(Todo todo)
{
  todo.isDone= !todo.isDone;
  notifyListeners();
}
void updateTodo(Todo todo, String title, String description)
{
  todo.title=title;
  todo.description=description;
  notifyListeners();
}
}