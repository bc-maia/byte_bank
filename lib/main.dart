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
  final TextEditingController _controlAccount = TextEditingController();
  final TextEditingController _controlAmount = TextEditingController();
  final TextEditingController _controlDescript = TextEditingController();

  // final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: globalKey,
      appBar:
          AppBar(backgroundColor: _greenTheme, title: Text('Transfer Form')),
      body: ListView(
        children: <Widget>[
          InputField(
              controller: _controlAccount,
              label: 'Account Number',
              hint: '000000',
              icon: Icons.person,
              type: TextInputType.number),
          InputField(
              controller: _controlAmount,
              label: 'Amount',
              hint: 'R\$100.00',
              icon: Icons.monetization_on,
              type: TextInputType.number),
          InputField(
            controller: _controlDescript,
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
              onPressed: () {
                final int account = int.tryParse(_controlAccount.text);
                final double amount = double.tryParse(_controlAmount.text);
                final String description = _controlDescript.text;

                if (account != null && amount != null && description != null) {
                  final transfer = Transfer(account, amount, description);
                  // For debugging :
                  // globalKey.currentState.showSnackBar(
                  //     SnackBar(content: Text(transfer.toString())));
                }
              },
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
  final TextEditingController controller;

  const InputField(
      {Key key, this.label, this.hint, this.icon, this.type, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller ?? null,
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
          TransferItem(Transfer(123000, 90.0, 'Transfer Description A')),
          TransferItem(Transfer(282930, 200.20, 'Transfer Description B')),
          TransferItem(Transfer(153384, 321.65, 'Transfer Description 3'))
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
            title: Text('R\$${_transfer.amount}'),
            subtitle: Text(_transfer.description)));
  }
}

class Transfer {
  final int account;
  final double amount;
  final String description;

  Transfer(this.account, this.amount, this.description);

  @override
  String toString() {
    return 'account: $account, value: $amount, description: $description';
  }
}
