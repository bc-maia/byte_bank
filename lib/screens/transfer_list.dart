import 'package:flutter/material.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/components/transfer_item.dart';
import 'package:bytebank/screens/transfer_form.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  static const _titleAppBar = 'Transfers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final _transfer = widget._transfers[index];
          return TransferItem(_transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future = Navigator.push(
              context, MaterialPageRoute(builder: (context) => TransferForm()));

          future.then((newTransfer) {
            if (newTransfer != null)
              setState(() => widget._transfers.add(newTransfer));
          });
        },
      ),
    );
  }
}
