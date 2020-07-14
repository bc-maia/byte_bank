import 'package:flutter/material.dart';
import 'package:bytebank/models/transfer.dart';

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
            title: Text('R\$${_transfer.amount}'),
            subtitle: Text(_transfer.description)));
  }
}
