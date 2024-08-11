import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LogService extends GetxService {
  late Logger logger;

  Future<LogService> init() async {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.dateAndTime,
      ),
      // 在发布模式下禁用日志
      level: kReleaseMode ? Level.off : Level.trace,
    );
    return this;
  }

  void debug(dynamic message) {
    logger.d(message);
  }

  void info(dynamic message) {
    logger.i(message);
  }

  void warning(dynamic message) {
    logger.w(message);
  }

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  void verbose(dynamic message) {
    logger.v(message);
  }

  // 使用 fatal 替代 wtf
  void fatal(dynamic message) {
    logger.f(message);
  }
}
