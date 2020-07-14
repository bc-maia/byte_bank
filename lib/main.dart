import 'package:flutter/material.dart';

import 'package:bytebank/screens/transfer_list.dart';

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
          buttonColor: Colors.green[800],
        ),
      ),
    );
  }
}
