import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[800], title: Text('Transferências')),
        floatingActionButton:
            FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
      ),
    );
  }
}
