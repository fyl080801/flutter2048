import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../reducers/moveDown.dart';
import '../reducers/moveLeft.dart';
import '../reducers/moveRight.dart';
import '../reducers/moveUp.dart';
import '../store/GameState.dart';
import '../utils/Screen.dart';

const pressTimeout = 200;
const dragLength = 300;

class Playground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, PlaygroundProps>(
      converter: (store) {
        return PlaygroundProps(
          mode: store.state.mode,
          startTime: 0,
          onDown: () => store.dispatch(MoveDownAction()),
          onLeft: () => store.dispatch(MoveLeftAction()),
          onRight: () => store.dispatch(MoveRightAction()),
          onUp: () => store.dispatch(MoveUpAction()),
        );
      },
      builder: (context, props) {
        return GestureDetector(
          onHorizontalDragStart: (evt) => onDragStart(evt, props),
          onHorizontalDragEnd: (evt) => onHorizontalDragEnd(evt, props),
          onVerticalDragStart: (evt) => onDragStart(evt, props),
          onVerticalDragEnd: (evt) => onVerticalDragEnd(evt, props),
          child: Container(
            color: Colors.transparent,
            height: Screen.stageWidth,
          ),
        );
      },
    );
  }

  void onDragStart(DragStartDetails evt, PlaygroundProps props) {
    props.startTime = DateTime.now().millisecondsSinceEpoch;
  }

  void onHorizontalDragEnd(DragEndDetails evt, PlaygroundProps props) {
    if (DateTime.now().millisecondsSinceEpoch - props.startTime >
            pressTimeout ||
        evt.primaryVelocity.abs() < dragLength) return;

    if (evt.primaryVelocity > 0) {
      props.onRight();
    } else {
      props.onLeft();
    }
  }

  void onVerticalDragEnd(DragEndDetails evt, PlaygroundProps props) {
    if (DateTime.now().millisecondsSinceEpoch - props.startTime >
            pressTimeout ||
        evt.primaryVelocity.abs() < dragLength) return;
    // 是否ios和android纵轴是相反的？
    if (evt.primaryVelocity < 0) {
      props.onUp();
    } else {
      props.onDown();
    }
  }
}

class PlaygroundProps {
  int mode;
  int startTime;
  Function onLeft;
  Function onRight;
  Function onUp;
  Function onDown;

  PlaygroundProps({
    this.mode,
    this.startTime,
    this.onDown,
    this.onLeft,
    this.onRight,
    this.onUp,
  });
}

// /// 用于响应交互操作
// class Playground extends StatelessWidget {
//   Playground(
//       {Key key,
//       this.gameType,
//       this.onRight,
//       this.onLeft,
//       this.onUp,
//       this.onDown,
//       this.onMoved})
//       : super(key: key);

//   final int gameType;
//   final Function onRight;
//   final Function onLeft;
//   final Function onUp;
//   final Function onDown;
//   final Function onMoved;

//   final TapStatus status = TapStatus();

//   double get borderWidth => Screen.getBorderWidth(gameType);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onHorizontalDragStart: onDragStart,
//       onHorizontalDragEnd: onHorizontalDragEnd,
//       onVerticalDragStart: onDragStart,
//       onVerticalDragEnd: onVerticalDragEnd,

//     );
//   }

// }
