import 'package:flutter/foundation.dart';

class CommonUtils {
  static final CommonUtils _singleton = CommonUtils._internal();

  factory CommonUtils() {
    return _singleton;
  }

  CommonUtils._internal();

  printLog(var log) {
    if (kDebugMode) {
      print('$log');
    }
  }
}
