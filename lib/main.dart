import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          Text(
            'Fast Development',
            textDirection: TextDirection.ltr,
            style: TextStyle(backgroundColor: Colors.red),
          ),
          Container(
              color: Colors.green,
              child: Text('Expressive and Flexible UI',
                  textDirection: TextDirection.ltr)),
          Container(
              color: Colors.blue,
              child:
                  Text('Native Performance', textDirection: TextDirection.ltr))
        ],
      ), //Column
    );
