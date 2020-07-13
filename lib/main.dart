import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Color _green = Colors.green[800];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar:
              AppBar(backgroundColor: _green, title: Text('Transferências')),
          floatingActionButton: FloatingActionButton(
              onPressed: () => print('click cria nova transfer'),
              backgroundColor: _green,
              child: Icon(Icons.add)),
          body: _ListaTransfers()),
    );
  }
}

class _ListaTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 1.0,
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('R\$100'),
            subtitle: Text('Transfer Description'),
          ),
        ),
      ],
    );
  }
}
