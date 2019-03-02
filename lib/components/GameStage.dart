import 'package:flutter/material.dart';
import 'package:flutter_hello/components/ModeSelector.dart';
import 'package:flutter_hello/constants/Display.dart';
import 'package:flutter_hello/reducers/index.dart';
import 'package:flutter_hello/store/GameState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class GameStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: Store<GameState>(gameReducer, initialState: GameState.initial()),
      child: Container(
        margin: EdgeInsets.all(Display.borderSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ModeSelector(),
            StoreConnector<GameState, int>(
              converter: (store) => store.state.mode,
              builder: (context, vm) {
                return Text(vm.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}

// class GameStage extends StatefulWidget {
//   const GameStage({Key key, this.status}) : super(key: key);

//   final GameStatus status;

//   @override
//   State<StatefulWidget> createState() => GameStageState(status);
// }

// class GameStageState extends State<GameStage> {
//   GameStageState(this.status);

//   GameStatus status;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           TypeSelector(
//             // 模式选择
//             onTypeChanged: setGameType,
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   child: Text(status.scores.toString()),
//                 ),
//                 Container()
//               ],
//             ),
//           ),
//           Stack(
//             // 交互区
//             children: <Widget>[
//               GameBg(
//                 gameType: status.gameType,
//               ),
//               Blocks(
//                 status: status,
//               ),
//               Playground(
//                 gameType: status.gameType,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void setGameType(int type) {
//     var random = new Random();
//     var gamesize = status.gameType * status.gameType;
//     var block1 = random.nextInt(gamesize - 1);
//     var block2 = random.nextInt(gamesize - 1);

//     while (block1 == block2) {
//       block2 = random.nextInt(gamesize);
//     }

//     setState(() {
//       status.gameType = type;
//     });
//   }
// }
