import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formkey = GlobalKey<FormState>();
  String _title = "";
  String _priority = "";
  DateTime _date  = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        GestureDetector(onTap: () {}, child: Icon(Icons.arrow_back_ios))
      ,
      SizedBox(height: 20.0),
      
      Text("Add Text", style :TextStyle(
        color: Colors.black , fontSize:40.0 , fontWeight:FontWeight.bold
      ))
      ],
    ));
  }
}
