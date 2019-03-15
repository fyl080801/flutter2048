import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter2048/components/block/BaseBlock.dart';
import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter2048/utils/Screen.dart';
import 'package:flutter_redux/flutter_redux.dart';

class StaticBlock extends StatelessWidget {
  final BlockInfo info;

  StaticBlock({
    Key key,
    this.info,
    // AnimationController controller,
  }) : super(
          key: key,
          // animation: new Tween<double>(begin: 0, end: 0).animate(controller),
        );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, BlockProps>(
      converter: (store) => BlockProps(
            blockWidth: Screen.getBlockWidth(store.state.mode),
            borderWidth: Screen.getBorderWidth(store.state.mode),
          ),
      builder: buildBlock,
    );
  }

  Widget buildBlock(BuildContext context, BlockProps props) {
    return Positioned(
      top: this.info.y * (props.blockWidth + props.borderWidth),
      left: this.info.x * (props.blockWidth + props.borderWidth),
      child: Container(
        width: props.blockWidth,
        height: props.blockWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(this.info.value.toString()),
        ),
      ),
    );
  }
}
