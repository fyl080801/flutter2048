import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ChangeControllers {
  AnimationController increaseController;
  AnimationController addController;

  factory ChangeControllers(TickerProviderStateMixin parent) {
    if (_cache != null) {
      return _cache;
    } else {
      _cache = new ChangeControllers._internal(parent);
      return _cache;
    }
  }

  ChangeControllers._internal(TickerProviderStateMixin parent);

  play() {
    addController.forward();
    increaseController.forward();
  }

  static ChangeControllers _cache;

  static ChangeControllers create(TickerProviderStateMixin parent) {
    return ChangeControllers(parent);
  }
}
