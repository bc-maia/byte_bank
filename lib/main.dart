import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

void main() => runApp(BankApp());

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: TransferList(),
      theme: ThemeData(
          primaryColor: Colors.green[800],
          accentColor: Colors.green[400],
          buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              buttonColor: Colors.green[800])),
    );
  }
}

class TransferForm extends StatefulWidget {
  @override
  createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _controlAccount = TextEditingController();
  final TextEditingController _controlAmount = TextEditingController();
  final TextEditingController _controlDescript = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: globalKey,
      appBar: AppBar(title: Text('Transfer Form')),
      body: SingleChildScrollView(
        child: Column(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                onPressed: () => _createNewTransfer(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createNewTransfer(BuildContext context) {
    final int account = int.tryParse(_controlAccount.text);
    final double amount = double.tryParse(_controlAmount.text);
    final String description = _controlDescript.text;

    if (account != null && amount != null && description != null) {
      final newTransfer = Transfer(account, amount, description);
      Navigator.pop(context, newTransfer);
    }
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;

  const InputField(
      {Key key,
      this.label,
      this.hint,
      this.icon,
      this.type = TextInputType.text,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller ?? null,
        decoration: InputDecoration(
            labelText: label, icon: Icon(icon) ?? null, hintText: hint),
        keyboardType: type,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transfers')),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final _transfer = widget._transfers[index];
          return TransferItem(_transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future<Transfer> future = Navigator.push(context,
                MaterialPageRoute(builder: (context) => TransferForm()));

            future.then((newTransfer) {
              Future.delayed(Duration(seconds: 1), () {
                if (newTransfer != null)
                  setState(() => widget._transfers.add(newTransfer));
              });
            });
          },
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
