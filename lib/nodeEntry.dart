import 'package:flutter/material.dart';

class NodeEntry extends StatefulWidget {
  @override
  _NodeEntryState createState() => _NodeEntryState();
}

class _NodeEntryState extends State<NodeEntry> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Enter new node'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: myController,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Add node'))
              ],
            )));
  }
}
