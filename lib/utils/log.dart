import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

// API for sending log output.
//
// The order in terms of verbosity, from least to most is ERROR, WARN, INFO,
// DEBUG, VERBOSE. Verbose should never be compiled into an application except
// during development. Debug logs are compiled in but stripped at runtime.
// Error, warning and info logs are always kept.
class Log {
  static const String _defaultTag = 'log';
  static final Map _mapTagToLevel = <String, Level>{};

  // Priority constant for the println method; use Log.v.
  static const Level verboseLevel = Level('VERBOSE', 300);

  // Priority constant for the println method; use Log.d.
  static const Level debugLevel = Level('DEBUG', 500);

  // Priority constant for the println method; use Log.i.
  static const Level infoLevel = Level('INFO', 800);

  // Priority constant for the println method; use Log.w.
  static const Level warnLevel = Level('WARN', 900);

  // Priority constant for the println method; use Log.e.
  static const Level errorLevel = Level('ERROR', 1000);

  // Hidden constructor.
  Log._();

  // Checks to see whether or not a log for the specified tag is loggable at
  // the specified level.
  static bool isLoggable(String? tag, Level level) {
    var tagLevel = _mapTagToLevel[tag ?? _defaultTag];
    tagLevel ??= kDebugMode ? debugLevel : infoLevel;
    return level >= tagLevel;
  }

  // Sets the logging level for a given tag.
  static void setLevel(String? tag, Level level) {
    if (tag != null) {
      _mapTagToLevel[tag] = level;
    }
  }

  /// Logs a verbose message with optional exception and stacktrace
  static void v({String? tag, String? msg, dynamic err, StackTrace? stack}) {
    if (kDebugMode) {
      println(verboseLevel, tag: tag, msg: msg, err: err, stack: stack);
    }
  }

  /// Logs a debug message with optional exception and stacktrace
  static void d({String? tag, String? msg, dynamic err, StackTrace? stack}) {
    println(debugLevel, tag: tag, msg: msg, err: err, stack: stack);
  }

  /// Logs an info message with optional exception and stacktrace
  static void i({String? tag, String? msg, dynamic err, StackTrace? stack}) {
    println(infoLevel, tag: tag, msg: msg, err: err, stack: stack);
  }

  /// Logs a warning message with optional exception and stacktrace
  static void w({String? tag, String? msg, dynamic err, StackTrace? stack}) {
    println(warnLevel, tag: tag, msg: msg, err: err, stack: stack);
  }

  /// Logs an error message with optional exception and stacktrace
  static void e({String? tag, String? msg, dynamic err, StackTrace? stack}) {
    println(errorLevel, tag: tag, msg: msg, err: err, stack: stack);
  }

  /// Logs an assert message with optional exception and stacktrace
  static void println(Level level,
      {String? tag, String? msg, dynamic err, StackTrace? stack}) {
    if (!isLoggable(tag ?? _defaultTag, level)) {
      return;
    }

    if (msg == null || msg.isEmpty) {
      if (err == null && stack == null) {
        return;
      }
      msg = '$level ${DateTime.now()}';
    } else {
      msg = '$level ${DateTime.now()}\n$msg';
    }

    if (err is Error) {
      stack ??= err.stackTrace;
    }

    log(
      msg,
      error: err,
      stackTrace: stack,
      time: DateTime.now(),
      name: tag ?? _defaultTag,
      level: level.value,
    );
  }
}
