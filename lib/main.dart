import 'package:flutter/material.dart';

void main() => runApp(BankApp());

Color _greenTheme = Colors.green[800];

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: TransferForm(),
    );
  }
}

class TransferForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: _greenTheme, title: Text('Transfer Form')),
      body: ListView(
        children: <Widget>[
          InputField(
              label: 'Account Number',
              hint: '000000',
              icon: Icons.person,
              type: TextInputType.number),
          InputField(
              label: 'Amount',
              hint: 'R\$100.00',
              icon: Icons.monetization_on,
              type: TextInputType.number),
          InputField(
            label: 'Description',
            hint: 'Mortgage/Rent',
            icon: Icons.info,
          ),
          Center(
            heightFactor: 2,
            child: RaisedButton(
              child: Text('Submit'),
              color: _greenTheme,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              onPressed: () => print('submit'),
            ),
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType type;

  const InputField({Key key, this.label, this.hint, this.icon, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: label, icon: Icon(icon) ?? null, hintText: hint),
        keyboardType: type ?? TextInputType.text,
        style: TextStyle(fontSize: 16.0),
      ),
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
    return Scaffold(
      appBar:
          AppBar(backgroundColor: _greenTheme, title: Text('Transferências')),
      body: ListView(
        children: <Widget>[
          TransferItem(Transfer(90.0, 'Transfer Description A')),
          TransferItem(Transfer(200.20, 'Transfer Description B')),
          TransferItem(Transfer(321.65, 'Transfer Description 3'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => print('click - add new transfer entry'),
          backgroundColor: _greenTheme,
          child: Icon(Icons.add)),
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
