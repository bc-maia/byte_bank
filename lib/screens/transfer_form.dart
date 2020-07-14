import 'package:flutter/material.dart';
import 'package:bytebank/components/input_field.dart';
import 'package:bytebank/models/transfer.dart';

class TransferForm extends StatefulWidget {
  @override
  createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _controlAccount = TextEditingController();
  final TextEditingController _controlAmount = TextEditingController();
  final TextEditingController _controlDescript = TextEditingController();

  // TODO: extract to support multiple languages
  static const _titleAppBar = 'Transfer Form';
  static const _labelAcc = 'Account Number';
  static const _hintAcc = '000000';
  static const _labelAmo = 'Amount';
  static const _hintAmo = '0.00';
  static const _labelDsc = 'Description';
  static const _hintDsc = 'Mortgage/Rent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: globalKey,
      appBar: AppBar(title: Text(_titleAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InputField(
                controller: _controlAccount,
                label: _labelAcc,
                hint: _hintAcc,
                icon: Icons.person,
                type: TextInputType.number),
            InputField(
                controller: _controlAmount,
                label: _labelAmo,
                hint: _hintAmo,
                icon: Icons.monetization_on,
                type: TextInputType.number),
            InputField(
              controller: _controlDescript,
              label: _labelDsc,
              hint: _hintDsc,
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
