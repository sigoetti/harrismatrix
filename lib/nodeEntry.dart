import 'package:flutter/material.dart';

class NodeEntry extends StatefulWidget {
  @override
  _NodeEntryState createState() => _NodeEntryState();
}

class _NodeEntryState extends State<NodeEntry> {
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selected = "1";  //TODO: how to populate with real values? Creates side effect.

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> getDropDownMenuItems() {
      List<DropdownMenuItem<String>> items = [];
      for (int i = 0; i < 5; i++) {
        items.add(new DropdownMenuItem(
            value: i.toString(), child: Text(i.toString())));
      }
      selected = items[0].value.toString();
      return items;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Enter new node'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Schichtname"),
                      controller: myController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Bitte Schichtname eingeben';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField(
                      value: selected,
                      decoration: InputDecoration(labelText: "Schicht oben"),
                      items: getDropDownMenuItems(),
                      onChanged: (value) {
                        selected = value.toString();
                      },
                    ),
                    DropdownButtonFormField(
                      value: selected,
                      decoration: InputDecoration(labelText: "Schicht unten"),
                      hint: Text("please choose one"),
                      items: getDropDownMenuItems(),
                      onChanged: (value) {
                        selected = value.toString();
                      },
                    ),
                    DropdownButtonFormField(
                      value: selected,
                      decoration:
                          InputDecoration(labelText: "Gleiche Höhe wie"),
                      hint: Text("please choose one"),
                      items: getDropDownMenuItems(),
                      onChanged: (value) {
                        selected = value.toString();
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //TODO: replace this with database entry
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                            Navigator.pop(context);
                          } else {
                            SnackBar(content: Text('Add some text!'));
                          }
                        },
                        child: Text('Schicht hinzufügen'))
                  ],
                ))));
  }
}
