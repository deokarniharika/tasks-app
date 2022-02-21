import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/tododo.dart';

import './intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (change) => TodosProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: IntroScreen(),
        ),
    );
  }
}



