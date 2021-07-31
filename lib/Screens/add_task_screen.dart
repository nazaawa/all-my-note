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
  DateTime _date = DateTime.now();

  TextEditingController _dateController =  TextEditingController();
  _handleDatePicker()async{
final DateTime? date = await showDatePicker(
  context :context,
  initialDate :_date,
  firstDate : DateTime(2000),
  lastDate : DateTime(2050),
);
if (date != null && date != _date){
  setState(() {
    _date= date;
  });
  _dateController.text = _date.toString();
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(onTap: () {}, child: Icon(Icons.arrow_back_ios)),
        SizedBox(height: 20.0),
        Text("Add Text",
            style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    style: TextStyle(fontSize: 18.0),
                    validator: (value) {
                      return value!.trim().isEmpty ? 'Entre une Tache' : null;
                    },
                    onSaved: (value) => _title = value!,
                    initialValue: _title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    onTap: _handleDatePicker,
                    decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    style: TextStyle(fontSize: 18.0),
                    validator: (value) {
                      return value!.trim().isEmpty ? 'Entre une Tache' : null;
                    },
                    onSaved: (value) => _title = value!,
                    initialValue: _title,
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
