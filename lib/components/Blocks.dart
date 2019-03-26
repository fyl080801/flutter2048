import 'package:flutter/material.dart';
import 'package:flutter2048/service/BlockFactory.dart';
import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter2048/utils/Screen.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Blocks extends StatefulWidget {
  @override
  BlocksState createState() => BlocksState();
}

class BlocksState extends State<Blocks> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, BlocksProps>(
      converter: (store) => BlocksProps(
            data: store.state.data,
            mode: store.state.mode,
            padding: Screen.getBorderWidth(store.state.mode),
          ),
      builder: (context, props) {
        var blockFactory = BlockFactory(this, props.mode);
        blockFactory.play();
        return Container(
          width: Screen.stageWidth,
          height: Screen.stageWidth,
          padding: EdgeInsets.fromLTRB(props.padding, props.padding, 0, 0),
          child: Stack(
            fit: StackFit.expand,
            children: getBlocks(blockFactory, props),
          ),
        );
      },
    );
  }

  getBlocks(BlockFactory blockFactory, BlocksProps props) {
    var blocks = <Widget>[];
    props.data.forEach((row) {
      row.forEach((block) {
        if (block.value != 0) {
          blocks.add(blockFactory.create(block));
        }
      });
    });
    return blocks;
  }
}

class BlocksProps {
  int mode;
  double padding;
  List<List<BlockInfo>> data;

  BlocksProps({this.padding, this.mode, this.data});
}
