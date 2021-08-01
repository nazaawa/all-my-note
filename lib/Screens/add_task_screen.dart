import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final List<String> _priorities = ['faible', "Moyen", "Elever"];

  final DateFormat _dateFormatter = DateFormat("MMM dd ,yyyy");

  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = _dateFormatter.format(_date);
  }

  @override
  dispose() {
    _dateController.dispose();
    super.dispose();
  }

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
    }
  }

  _submit() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      Navigator.of(context);
      print("$_title, $_date,$_priority");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  return FocusScope.of(context).unfocus();
                },
                child: Icon(Icons.arrow_back_ios)),
            Text("Add Task",
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
                          return value!.trim().isEmpty
                              ? 'Entre une Tache'
                              : null;
                        },
                        onSaved: (value) => _title = value!,
                        initialValue: _title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        readOnly: true,
                        controller: _dateController,
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
                      child: DropdownButtonFormField(
                        isDense: true,
                        icon: Icon(Icons.arrow_drop_down_circle),
                        items: _priorities.map((String priority) {
                          return DropdownMenuItem(
                            child: Text(
                              priority,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            value: priority,
                          );
                        }).toList(),
                        decoration: InputDecoration(
                            labelText: 'priorité',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        style: TextStyle(fontSize: 18.0),
                        validator: (dynamic value) => _priority == ''
                            ? 'Entre  la priorité de la tache'
                            : null,
                        onChanged: (dynamic value) {
                          setState(() {
                            return _priority = value;
                          });
                        },
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).primaryColor),
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 60.0,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: _submit,
                          child: Text("Add",
                              style: TextStyle(color: Colors.white)),
                        ))
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
