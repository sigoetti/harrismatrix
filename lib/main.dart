import 'package:flutter/material.dart';
import 'package:harris_matrix/overviewPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: OverviewPage(),
    );
  }
}
