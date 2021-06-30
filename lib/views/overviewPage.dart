import 'package:flutter/material.dart';
import 'package:harris_matrix/views/nodeEntry.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Harris Matrix Tool'),
        ),
        body: Padding(
            //child: Text('Fancy painting goes here'),
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              child: const Icon(Icons.plus_one),
                onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NodeEntry()),
              );
            })),
      ),
    );
  }
}
