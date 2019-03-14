import 'package:flutter/widgets.dart';
import 'package:flutter2048/utils/Screen.dart';

abstract class BaseBlock extends AnimatedWidget {
  final int mode;

  double get blockWidth => Screen.getBlockWidth(this.mode);
  double get borderWidth => Screen.getBorderWidth(this.mode);
  double get width => blockWidth + borderWidth;

  BaseBlock({Key key, this.mode, Animation<double> animation})
      : super(
          key: key,
          listenable: animation,
        );
}
