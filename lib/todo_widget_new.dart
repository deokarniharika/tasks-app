import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'todo.dart';
import './profile.dart';
import './tododo.dart';
import './edit.dart';
import 'todo_list_widget.dart';

class TodoWidget extends StatelessWidget{
 final Todo todo;

 const TodoWidget({
   required this.todo,
   Key? key,
}) : super(key : key);

 @override
  Widget build(BuildContext context) => ClipRect(
    child: Slidable(
     // Specify a key if the Slidable is dismissible.
     key: Key(todo.id),

     // The start action pane is the one at the left or the top side.
       //at left
     startActionPane: ActionPane(
       // A motion is a widget used to control how the pane animates.
       motion: ScrollMotion(),

       // A pane can dismiss the Slidable.

       // All actions are defined in the children parameter.
       children: [
         // A SlidableAction can have an icon and/or a label.
         SlidableAction(
           onPressed: (_)=> EditTodo(context, todo),
           //EditTodo(context, todo)
           backgroundColor: Color(0xFF7BC043),
           foregroundColor: Colors.white,
           icon: Icons.edit,
           label: 'Edit',
         ),
       ],
     ),

     // The end action pane is the one at the right or the bottom side.
       //at right side
     endActionPane: ActionPane(
       motion: ScrollMotion(),
       children: [
         SlidableAction(
           // An action can be bigger than the others.
           flex: 2,
           onPressed: (_)=> DeleteTodo(context, todo),
           backgroundColor: Color(0xFFFE4A49),
           foregroundColor: Colors.white,
           icon: Icons.delete,
           label: 'Delete',
         ),
       ],
     ),

     // The child of the Slidable is what the user sees when the
     // component is not dragged.
     //child: const ListTile(title: Text('Slide me')),
     child: buildTodo(context)

       ),
  );

 Widget buildTodo(BuildContext context) =>
     GestureDetector(
       onTap: ()=> edittodo(context, todo),
       child: Container(
   color: Colors.white,
    padding: const EdgeInsets.all(8.0),
    child: Row(
       children: [
       Checkbox(
         activeColor: Theme.of(context).primaryColor,
         checkColor: Colors.black45,
         value: todo.isDone,
         onChanged: (_) {
           final provider= Provider.of<TodosProvider>(context, listen: false);
           final isDone= provider.toggleTodoStatus(todo);
           const snackBar = SnackBar(
             content: Text('Task marked as complete'),
           );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
           ScaffoldMessenger.of(context).showSnackBar(snackBar);
         },
       ),
         const SizedBox(width: 20),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(todo.title,
               style: TextStyle(
                 fontSize: 17,
                 fontWeight: FontWeight.bold,
               )),
               if(todo.description.isNotEmpty)
                 Container(
                   margin: EdgeInsets.only(top: 4),
                   child: Text(
                     todo.description,
                     style: TextStyle(fontSize: 15, height: 1.5),
                   )
                 )
             ],
           )
         )
       ],
 ),
  ),
     );

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

 void EditTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
     MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo),
     ),
 );
 void edittodo(BuildContext context, Todo todo)=> Navigator.of(context).push(
     MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo),
 ),
 );
}