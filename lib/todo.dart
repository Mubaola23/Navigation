import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                              label: Text("Enter your todo here"),
                              labelStyle: TextStyle(
                                  color: Colors.orange, fontSize: 18)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Text("Add Todo"),
                        )
                      ],
                    ),
                  ));
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Todoly",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                        height: 100,
                        padding: EdgeInsets.all(24),
                        child: Text("Herre is your to do")));
              },
              title: Text("Your Text here"),
              trailing: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
