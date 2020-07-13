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
              onPressed: () => print('click - add new transfer entry'),
              backgroundColor: _green,
              child: Icon(Icons.add)),
          body: TransferList()),
    );
  }
}

class TransferList extends StatefulWidget {
  @override
  createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TransferItem(Transfer(90.0, 'Transfer Description A')),
        TransferItem(Transfer(200.20, 'Transfer Description B')),
        TransferItem(Transfer(321.65, 'Transfer Description 3'))
      ],
    );
  }
}

class TransferItem extends StatelessWidget {
  @required
  final Transfer _transfer;

  const TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1.0,
        child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('R\$${_transfer.value}'),
            subtitle: Text(_transfer.description)));
  }
}

class Transfer {
  final double value;
  final String description;

  Transfer(this.value, this.description);
}
