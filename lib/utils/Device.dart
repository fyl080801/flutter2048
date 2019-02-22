import 'dart:ui';
import 'dart:io';

class Device {
  static get async => null;

  static double getRpx(double value) {
    return value / window.devicePixelRatio;
  }

  static Size size = window.physicalSize;

  static Platform platform = Platform();
}
