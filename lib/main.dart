import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Text(
            'Fast Development',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Expressive and Flexible UI',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Native Performance',
            textDirection: TextDirection.ltr,
          ),
          Column(children: <Widget>[
            Text(
              'Install Flutter today.',
              textDirection: TextDirection.ltr,
            ),
          ])
        ],
      ), //Column
    );
