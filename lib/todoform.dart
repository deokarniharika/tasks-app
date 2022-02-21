import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget{
 final String? title;
 final String description;
 final ValueChanged<String> onChangedTitle;
 final ValueChanged<String> onChangedDescription;
 final VoidCallback onSavedTodo;

 const TodoFormWidget({
   Key? key,
   this.title='',
   this.description='',
   required this.onChangedTitle,
   required this.onChangedDescription,
   required this.onSavedTodo,
 }) : super(key: key);

 @override
  Widget build(BuildContext context) => Form(
    child: SingleChildScrollView(
     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: [
         buildTitle(),
         SizedBox(height: 10),
         buildDescription(),
         SizedBox(height: 25),
         buildSaveButton(),
       ]
     )
 ),
  );

 //we are creating a form for taking notes

 Widget buildTitle()=> TextFormField(
   decoration: const InputDecoration(
     labelText: 'Title',
   ),
   maxLines: 1,
   initialValue: title,
   onChanged: onChangedTitle,
   validator: (title){
     if (title== null)
       {
         return 'The title cannot be empty';
       }
     return null;
   },
 );


 Widget buildDescription() => TextFormField(
   maxLines: 1,
   decoration : const InputDecoration(
     labelText: 'Description',
   ),
   initialValue: description,
   onChanged: onChangedDescription,
 );

 Widget buildSaveButton() => SizedBox(
   height: 30,
   width: 100,
   child: ElevatedButton(
     style: ButtonStyle(
       backgroundColor: MaterialStateProperty.all(Colors.blue),
     ),
     onPressed: onSavedTodo,
     child: Text('SAVE'),
   ),
 );

}