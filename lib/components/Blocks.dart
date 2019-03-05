import 'package:flutter/material.dart';
import 'package:flutter2048/components/BlockContainer.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../utils/Screen.dart';

class Blocks extends StatefulWidget {
  @override
  BlocksState createState() => BlocksState();
}

class BlocksState extends State<Blocks> with TickerProviderStateMixin {
  AnimationController increaseController;
  AnimationController addController;
  AnimationController moveController;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, BlocksProps>(
      converter: (store) => BlocksProps(
            data: store.state.data,
            padding: Screen.getBorderWidth(store.state.mode),
          ),
      builder: (context, props) {
        increaseController = AnimationController(
            duration: const Duration(milliseconds: 50), vsync: this);
        addController = AnimationController(
            duration: const Duration(milliseconds: 80), vsync: this);
        moveController = AnimationController(
            duration: const Duration(milliseconds: 100), vsync: this);

        moveController.forward().whenComplete(() {
          addController.forward();
          increaseController.forward();
        });

        return Container(
          width: Screen.stageWidth,
          height: Screen.stageWidth,
          padding: EdgeInsets.fromLTRB(props.padding, props.padding, 0, 0),
          child: Stack(
            fit: StackFit.expand,
            children: getBlocks(props),
          ),
        );
      },
    );
  }

  getBlocks(BlocksProps props) {
    var blocks = <Widget>[];
    for (var i = 0; i < props.data.length; i++) {
      for (var j = 0; j < props.data[i].length; j++) {
        if (props.data[i][j] != 0) {
          blocks.add(BlockContainer(
            x: i,
            y: j,
            type: 0,
            addController: addController,
            increaseController: increaseController,
          ));
        }
      }
    }
    return blocks;
  }
}

class BlocksProps {
  // int mode;
  double padding;
  List<List<int>> data;

  BlocksProps({this.padding, this.data});
}
