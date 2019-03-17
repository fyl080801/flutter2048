import 'package:flutter/material.dart';

class NumberText extends StatelessWidget {
  final int value;
  final double size;

  NumberText({this.value, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.transparent, width: 0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(
        this.value.toString(),
        style: TextStyle(color: Color(0xff776e65)),
      )),
    );
  }
}

enum NumberStyles {
  Witie,
}
