import 'package:flutter/material.dart';

class TypeSelector extends StatelessWidget {
  const TypeSelector({Key key, this.onTypeChanged}) : super(key: key);

  final Function onTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              this.onTypeChanged(4);
            },
            child: Text('4'),
          ),
          RaisedButton(
            onPressed: () {
              this.onTypeChanged(6);
            },
            child: Text('6'),
          ),
          RaisedButton(
            onPressed: () {
              this.onTypeChanged(8);
            },
            child: Text('8'),
          ),
          RaisedButton(
            onPressed: () {
              this.onTypeChanged(10);
            },
            child: Text('10'),
          )
        ],
      ),
    );
  }
}
