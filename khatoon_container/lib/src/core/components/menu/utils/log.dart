import 'package:ant_design_flutter/ant_design_flutter.dart';

class Log {
  static void info(String tag, String msg) {
    debugPrint('\x1B[34mℹ️ [$tag] $msg\x1B[0m'); // آبی
  }

  static void success(String tag, String msg) {
    debugPrint('\x1B[32m✅ [$tag] $msg\x1B[0m'); // سبز
  }

  static void warn(String tag, String msg) {
    debugPrint('\x1B[33m⚠️ [$tag] $msg\x1B[0m'); // زرد
  }

  static void error(String tag, String msg, [Object? e, StackTrace? s]) {
    debugPrint('\x1B[31m❌ [$tag] $msg\x1B[0m'); // قرمز
    if (e != null) debugPrint('\x1B[31m   ↳ $e\x1B[0m');
    if (s != null) debugPrint('\x1B[90m$s\x1B[0m');
  }
}
