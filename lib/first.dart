import 'package:first_flutter/second.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("First Screen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Press this button to go to the next screen",
              style: TextStyle(fontSize: 24.0),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Second()));
                },
                child: Text("Go to next Screen"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
