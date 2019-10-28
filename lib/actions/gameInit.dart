import 'package:flutter2048/reducers/updateState.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter2048/store/GameStatus.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

gameInit(Store<GameState> store, int mode) async {
  SharedPreferences refs = await SharedPreferences.getInstance();

  var key = 'total_' + mode.toString();

  if (store.state.status.total != null &&
      store.state.status.scores > store.state.status.total) {
    refs.setInt(key, store.state.status.scores);
  }
  var state = GameState.initial(mode);

  state.status = GameStatus(
    adds: 0,
    end: false,
    moves: 0,
    total: refs.getInt(key) ?? 0,
    scores: 0,
  );

  store.dispatch(UpdateStateAction(state));
}
