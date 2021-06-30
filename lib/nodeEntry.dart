import 'package:flutter/material.dart';

class NodeEntry extends StatefulWidget {
  @override
  _NodeEntryState createState() => _NodeEntryState();
}

class _NodeEntryState extends State<NodeEntry> {
  final levelNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selectedUpperLevel = "0";
  String selectedLowerLevel = "0";
  String selectedSideLevel = "0";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    levelNameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> getDropDownMenuItems() {
      List<DropdownMenuItem<String>> items = [];
      for (int i = 0; i < 5; i++) {
        items.add(new DropdownMenuItem(
            value: i.toString(), child: Text(i.toString())));
      }
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
                      controller: levelNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Bitte Schichtname eingeben';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(labelText: "Schicht oben"),
                      items: getDropDownMenuItems(),
                      onChanged: (value) {
                        selectedUpperLevel = value.toString();
                      },
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(labelText: "Schicht unten"),
                      items: getDropDownMenuItems(),
                      onChanged: (value) {
                        selectedLowerLevel = value.toString();
                      },
                    ),
                    DropdownButtonFormField(
                      decoration:
                          InputDecoration(labelText: "Gleiche Höhe wie"),
                      items: getDropDownMenuItems(),
                      onChanged: (value) {
                        selectedSideLevel = value.toString();
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //TODO: replace this with database entry
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                            print(levelNameController.text);
                            print(selectedUpperLevel+ selectedLowerLevel+ selectedSideLevel);
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
