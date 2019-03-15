import 'package:flutter/widgets.dart';
import 'package:flutter2048/store/BlockInfo.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter2048/utils/Screen.dart';
import 'package:flutter_redux/flutter_redux.dart';

abstract class BaseBlock extends AnimatedWidget {
  final BlockInfo info;

  BaseBlock({Key key, this.info, Animation<double> animation})
      : super(
          key: key,
          listenable: animation,
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

  @protected
  Widget buildBlock(
    BuildContext context,
    BlockProps props,
  );
}

class BlockProps {
  double blockWidth;
  double borderWidth;

  BlockProps({this.blockWidth, this.borderWidth});
}
