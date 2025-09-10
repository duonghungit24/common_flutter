import 'package:flutter/material.dart';
import 'dart:async';

class Debounce {
  int? milliseconds;
  Timer? timer;

  Debounce({required this.milliseconds});

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }

  dispose() {
    timer?.cancel();
  }
}
