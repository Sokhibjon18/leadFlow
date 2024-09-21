import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

extension Logger on Object {
  void appLog([dynamic arg]) async {
    if(kReleaseMode) return;
    final log = '${timeNow()} [$hashCode] $runtimeType: $arg';
    kIsWeb ? print(log) : dev.log(log);
  }
}

String timeNow() {
  DateTime time = DateTime.now();
  var hour = time.hour;
  var minutes = time.minute;
  var seconds = time.second;
  var milliseconds = time.millisecond;
  return "$hour:$minutes:$seconds:$milliseconds";
}