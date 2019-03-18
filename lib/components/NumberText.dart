import 'package:flutter/material.dart';

var styles = {
  2: {
    "color": Color(0xff776e65),
    "background": Color(0xffeee4da),
  },
  4: {
    "color": Color(0xff776e65),
    "background": Color(0xffede0c8),
  },
  8: {
    "color": Color(0xfff9f6f2),
    "background": Color(0xfff2b179),
  },
  16: {
    "color": Color(0xfff9f6f2),
    "background": Color(0xfff59563),
  },
  32: {
    "color": Color(0xfff9f6f2),
    "background": Color(0xfff67c5f),
  },
  64: {
    "color": Color(0xfff9f6f2),
    "background": Color(0xfff65e3b),
  },
  128: {
    "color": Color(0xfff9f6f2),
    "background": Color(0xffedcf72),
  },
  256: {
    "color": Color(0xfff9f6f2),
    "background": Color(0xfff9f6f2),
  },
  512: {
    "color": Color(0xfff9f6f2),
    "background": Color(0xffedc850),
  },
  1024: {
    "background": Color(0xffedc53f),
  },
  2048: {
    "color": Color(0xfff9f6f2),
    "background": Color(0xffedc22e),
  }
};

class NumberText extends StatelessWidget {
  final int value;
  final double size;

  NumberText({this.value, this.size});

  @override
  Widget build(BuildContext context) {
    var numberText = this.value.toString();
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: styles[this.value]['background'],
        border: Border.all(color: Colors.transparent, width: 0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          numberText,
          style: TextStyle(
            color: styles[this.value]['color'],
            fontSize: size / (numberText.length < 2 ? 2 : numberText.length),
          ),
        ),
      ),
    );
  }
}
