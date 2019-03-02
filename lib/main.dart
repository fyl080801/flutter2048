import 'package:flutter/material.dart';
import './components/GameStage.dart';
import './components/ViewScaffold.dart';
import './model/GameStatus.dart';

void main() => runApp(MyApp());

/* ************************************************************
 * 思路:
 * 1.根据游戏模式构建数据矩阵
 * 2.每个块作为一个对象处理数值变化
 * 3.块的数值变化产生一个事件，输出变化的初始状态和结束状态
 * 4.单独用动画组件响应事件画出对象和动画
 * ************************************************************/

class MyApp extends StatelessWidget {
  final GameStatus status = new GameStatus();

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      children: <Widget>[
        GameStage(),
      ],
    );
  }
}
