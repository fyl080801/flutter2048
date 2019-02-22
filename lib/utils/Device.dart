import 'dart:ui';

class Device {
  static double getRpx(double value) {
    return value / window.devicePixelRatio;
  }

  static Size size = window.physicalSize;
}
