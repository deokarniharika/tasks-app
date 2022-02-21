import 'package:flutter/material.dart';
import './todowidget.dart';
import './todo_list_widget.dart';
import './profile.dart';
import './complete.dart';

class HomePage extends StatefulWidget {
  @override
  _MyBottomHomeAppState createState() => _MyBottomHomeAppState();
}

class _MyBottomHomeAppState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs= [
    TodoListWidget(),
    CompletedListWidget(),
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

//this has bottom  navigation bars plus floatingaction button

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Todo app"),
      ),
       //respective body will appear when the certain option is selected
      bottomNavigationBar: BottomNavigationBar(onTap: onTappedBar, currentIndex: _currentIndex, items: [
        BottomNavigationBarItem(icon: new Icon(Icons.list), title: new Text("ToDo")),
        BottomNavigationBarItem(icon: new Icon(Icons.done_outline), title: new Text("Done")),
      ]),
      body: tabs[_currentIndex],
      floatingActionButton: FloatingActionButton(
                  onPressed: () =>  showDialog(
                      context: ctx,
                      builder: (_)=> Todo_dialog_Widget(),
                    ),

                  //showDIalog ends


                  child: Icon(Icons.add),
                  backgroundColor: Colors.black,
                ),
    );

  }
}



