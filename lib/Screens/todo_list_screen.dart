import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {


   _buildTask(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 25),
      child: Column(
        children: [
          ListTile(
            title: Text("Task Title"),
            subtitle: Text("31 juillet , 2 045"),
            trailing: Checkbox(value: true, onChanged: (value){
              print(value);

            },
            activeColor: Theme.of(context).primaryColor,
            ),
          ),
          Divider()
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 80.0),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mes Taches',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '1 to 10',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              );
            }else{
              return "coll";
            }
            return  _buildTask(index);
          }),
    );
  }
}
