import 'package:flutter/material.dart';

class MoveBlock extends AnimatedWidget {
  MoveBlock({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return null;
  }
}

// class NumberElement extends StatelessWidget {
//   NumberElement({
//     Key key,
//     this.animation,
//     this.status,
//   }) : super(key: key);

//   final GameStatus status;

//   final Animation<double> animation;

//   double get borderWidth => Screen.getBorderWidth(status.gameType);

//   double get blockWidth => Screen.getBlockWidth(status.gameType);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation,
//       builder: (BuildContext context, Widget child) {
//         return Positioned(
//           top: 0,
//           left: animation.value,
//           child: child,
//         );
//       },
//       child: Container(
//         width: blockWidth,
//         height: blockWidth,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.transparent, width: 0),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Center(
//           child: Text('2'),
//         ),
//       ),
//     );
//   }
// }
