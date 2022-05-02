import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  //todo list items
  final List _todoItems = [];

  // controller to help us track the changes in our text field
  final textController = TextEditingController();

  // Function to add todo items

  addTodo(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.add(task);
      });
    }
  }

  deleteTodo(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }
  // onDispose() {
  //   // clears the text field
  //   textController.dispose();
  //
  //   super.dispose();
  // }
  // onInit(){
  //
  //   // Perform operation on start of a screen
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        TextField(
                          controller: textController,
                          onChanged: (value) {
                            print(value);
                            print(textController.text);
                          },
                          decoration: const InputDecoration(
                              label: Text("Enter your todo here"),
                              labelStyle: TextStyle(
                                  color: Colors.orange, fontSize: 18)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        RaisedButton(
                          onPressed: () {
                            addTodo(textController.text);
                            textController.clear();
                            Navigator.pop(context);
                          },
                          child: Text("Add Todo"),
                        )
                      ],
                    ),
                  ));
        },
        child: const Icon(Icons.add, color: Colors.white),
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
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const FlutterLogo(
              size: 30,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: _todoItems.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              padding: const EdgeInsets.all(24),
                              child: Text(
                                _todoItems[index],
                              ),
                            ),
                          );
                        },
                        child: Text(_todoItems[index])),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 50),
                                  color: Colors.white,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                          "Are you Sure you want to delete?"),
                                      RaisedButton(
                                        onPressed: () {
                                          deleteTodo(index);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Delete Todo"),
                                      ),
                                    ],
                                  ),
                                ));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
