import 'package:all_my_note/Screens/todo_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch :Colors.red
      ),
      title: 'Flutter Demo', home: TodoListScreen());
  }
}
