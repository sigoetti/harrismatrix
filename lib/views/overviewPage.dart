import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:harris_matrix/models/shapes.dart';
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CustomPaint(
                    painter: RectanglePainter(),
                    child: Text("text"),
                  ),
                ],
              ),
              Row(
                children: [
                  FloatingActionButton(
                      child: const Icon(Icons.plus_one),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NodeEntry()),
                        );
                      }),

                ],
              ),
              FittedBox(
                fit: BoxFit.fill,
                child: InteractiveViewer(
                    constrained: true,
                    boundaryMargin: EdgeInsets.all(100),
                    minScale: 0.01,
                    maxScale: 5.6,
                    child: GraphView(
                      graph: graph,
                      algorithm: SugiyamaAlgorithm(conf),
                      paint: Paint()
                        ..color = Colors.green
                        ..strokeWidth = 1
                        ..style = PaintingStyle.stroke,
                      builder: (Node node) {
                        // I can decide what widget should be shown here based on the id
                        var a = node.key?.value as int;
                        return rectangleWidget(a);
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Random r = Random();

  Widget rectangleWidget(int a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.blue, spreadRadius: 1),
            ],
          ),
          child: Text('Node ${a}')),
    );
  }

  //example code of https://github.com/nabil6391/graphview

  final Graph graph = Graph()..isTree = true;
  SugiyamaConfiguration conf = SugiyamaConfiguration();

  @override
  void initState() {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node8 = Node.Id(7);
    final node7 = Node.Id(8);
    final node9 = Node.Id(9);
    final node10 = Node(rectangleWidget(10));
    final node11 = Node(rectangleWidget(11));
    final node12 = Node(rectangleWidget(12));
    final node13 = Node(rectangleWidget(13));

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3);
    graph.addEdge(node1, node4);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node3, node7);
    graph.addEdge(node6, node7);
    graph.addEdge(node6, node8);
    graph.addEdge(node4, node9);
    graph.addEdge(node4, node10);
    graph.addEdge(node4, node11);
    graph.addEdge(node11, node12);
    graph.addEdge(node12, node13);
    graph.addEdge(node7, node13);
    graph.addEdge(node8, node13);

    conf
      ..levelSeparation = (100)
      ..orientation = (SugiyamaConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
