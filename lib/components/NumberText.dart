import 'package:flutter/material.dart';

class BlockStyle {
  Color textColor;
  Color background;

  BlockStyle({this.textColor, this.background});
}

var styles = Map.fromEntries([
  MapEntry(2,
      BlockStyle(textColor: Color(0xff776e65), background: Color(0xffeee4da))),
  MapEntry(4,
      BlockStyle(textColor: Color(0xff776e65), background: Color(0xffede0c8))),
  MapEntry(8,
      BlockStyle(textColor: Color(0xfff9f6f2), background: Color(0xfff2b179))),
  MapEntry(16,
      BlockStyle(textColor: Color(0xfff9f6f2), background: Color(0xfff59563))),
  MapEntry(32,
      BlockStyle(textColor: Color(0xfff9f6f2), background: Color(0xfff67c5f))),
  MapEntry(64,
      BlockStyle(textColor: Color(0xfff9f6f2), background: Color(0xfff65e3b))),
  MapEntry(128,
      BlockStyle(textColor: Color(0xfff9f6f2), background: Color(0xffedcf72))),
  MapEntry(256,
      BlockStyle(textColor: Color(0xfff9f6f2), background: Color(0xffedcc61))),
  MapEntry(512,
      BlockStyle(textColor: Color(0xfff9f6f2), background: Color(0xffedc850))),
  MapEntry(1024,
      BlockStyle(textColor: Color(0xfff9f6f2), background: Color(0xffedc53f))),
  MapEntry(2048,
      BlockStyle(textColor: Color(0xfff9f6f2), background: Color(0xffedc22e))),
]);

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
        color: (this.value ~/ 2048) > 1
            ? styles[this.value ~/ 2048].background
            : styles[this.value].background,
        border: Border.all(color: Colors.transparent, width: 0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          numberText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: (this.value ~/ 2048) > 1
                ? styles[this.value ~/ 2048].textColor
                : styles[this.value].textColor,
            fontSize:
                size / (numberText.length <= 2 ? 2 : numberText.length * 0.8),
          ),
        ),
      ),
    );
  }
}
