import 'package:flutter/material.dart';
import 'package:flutter2048/components/block/NewBlock.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter2048/utils/Screen.dart';
import 'package:flutter_redux/flutter_redux.dart';

class BlockContainer extends StatelessWidget {
  final int x;
  final int y;
  final int type;
  AnimationController increaseController;
  AnimationController addController;

  BlockContainer(
      {Key key,
      this.x,
      this.y,
      this.type,
      this.addController,
      this.increaseController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, BlockContainerProps>(
      converter: (store) => BlockContainerProps(
            borderWidth: Screen.getBorderWidth(store.state.mode),
            blockWidth: Screen.getBlockWidth(store.state.mode),
            data: store.state.data,
          ),
      builder: (context, props) {
        var anmi = new Tween<double>(begin: 0.0, end: 1).animate(addController);
        return NewBlock(
          left: y * (props.blockWidth + props.borderWidth),
          top: x * (props.blockWidth + props.borderWidth),
          value: props.data[x][y],
          width: props.blockWidth,
          animation: anmi,
        );
      },
    );
  }
}

class BlockContainerProps {
  double blockWidth;
  double borderWidth;
  // double left;
  // double top;
  // 可替换成特殊对象处理变换
  List<List<int>> data;

  BlockContainerProps({this.blockWidth, this.borderWidth, this.data});
}

// class NumberBlock extends StatefulWidget {
//   const NumberBlock({Key key, this.status}) : super(key: key);

//   final GameStatus status;

//   @override
//   State<StatefulWidget> createState() => NumberBlockState();
// }

// class NumberBlockState extends State<NumberBlock>
//     with TickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> animation;

//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(duration: Duration(milliseconds: 250), vsync: this);
//     animation = Tween<double>(begin: 0, end: 50).animate(controller);
//     controller.forward();
//   }

//   @override
//   void setState(fn) {
//     super.setState(fn);

//     controller =
//         AnimationController(duration: Duration(milliseconds: 250), vsync: this);
//     animation = Tween<double>(begin: 0, end: 50).animate(controller);
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     setState(() {
//       controller = AnimationController(
//           duration: Duration(milliseconds: 250), vsync: this);
//       animation = Tween<double>(
//         begin: 0,
//         end: Screen.getBlockWidth(widget.status.gameType) +
//             Screen.getBorderWidth(widget.status.gameType),
//       ).animate(controller);
//       controller.forward();
//     });
//     return new NumberElement(
//       animation: animation,
//       status: widget.status,
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
