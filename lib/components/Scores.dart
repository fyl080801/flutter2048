import 'package:flutter/material.dart';
import 'package:flutter2048/reducers/restart.dart';
import 'package:flutter2048/store/GameState.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Scores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ScoresProps>(
      converter: (store) => ScoresProps(
            scores: store.state.status.scores,
            reset: () {
              store.dispatch(GameRestartAction(store.state.mode));
            },
          ),
      builder: (context, props) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '2048',
                  style: TextStyle(
                      fontSize: 50,
                      color: Color(0xff776e65),
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(23, 5, 23, 5),
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffbbada0),
                        border: Border.all(color: Colors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'SCORE',
                            style: TextStyle(
                                color: Color(0xffeee4da),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            props.scores.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(23, 5, 23, 5),
                      decoration: BoxDecoration(
                        color: Color(0xffbbada0),
                        border: Border.all(color: Colors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'BEST',
                            style: TextStyle(
                                color: Color(0xffeee4da),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '--',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Play 2048 Game flutter',
                      style: TextStyle(
                          color: Color(0xff776e65),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Join and get to the 2048 tile!',
                      style: TextStyle(color: Color(0xff776e65)),
                    ),
                  ],
                ),
                FlatButton(
                  color: Color(0xff8f7a66),
                  textColor: Colors.white,
                  onPressed: () => props.reset(),
                  child: Text(
                    'New Game',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class ScoresProps {
  ScoresProps({this.scores, this.reset});

  int scores;
  Function reset;
}
