import 'dart:developer';

class XLog {
  static red(String message, {StackTrace? stackTrace, String? name}) {
    if (name == null) {
      log('\x1B[31m$message\x1B[0m', stackTrace: stackTrace);
      return;
    }
    log('\x1B[31m[$name]: $message\x1B[0m', stackTrace: stackTrace);
  }

  // with name green
  static green(String message, {String? name}) {
    if (name == null) {
      log('\x1B[32m$message\x1B[0m');
      return;
    }
    log('\x1B[32m$message\x1B[0m');
  }

  static blue(String message, {String? name}) {
    if (name == null) {
      log('\x1B[34m$message\x1B[0m');
      return;
    }
    log('\x1B[34m[$name]: $message\x1B[0m');
  }

  static yellow(String message, {String? name}) {
    if (name == null) {
      log('\x1B[33m$message\x1B[0m');
      return;
    }
    log('\x1B[33m[$name]: $message\x1B[0m');
  }
}
