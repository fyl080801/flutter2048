import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../reducers/restart.dart';
import '../store/GameState.dart';

class ModeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ModeSelectorProps>(
      converter: (store) {
        return ModeSelectorProps(
          mode: store.state.mode,
          onChange: (mode) => store.dispatch(GameRestartAction(mode)),
        );
      },
      builder: (context, vm) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                onPressed: () => vm.onChange(4),
                child: Text('4'),
              ),
              RaisedButton(
                onPressed: () => vm.onChange(6),
                child: Text('6'),
              ),
              RaisedButton(
                onPressed: () => vm.onChange(8),
                child: Text('8'),
              ),
              RaisedButton(
                onPressed: () => vm.onChange(10),
                child: Text('10'),
              )
            ],
          ),
        );
      },
    );
  }
}

class ModeSelectorProps {
  ModeSelectorProps({this.mode, this.onChange});

  int mode;
  Function onChange;
}
