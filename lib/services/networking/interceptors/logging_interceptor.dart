import 'dart:convert';

import 'package:app_fox_movies/utils/log.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  /// Print request [Options]
  bool logRequest;

  /// Print request header [Options.headers]
  bool logRequestHeaders;

  /// Print request data [Options.data]
  bool logRequestBody;

  /// Print response [Options]
  bool logResponse;

  /// Print response header [Options.headers]
  bool logResponseHeaders;

  /// Print response data [Options.data]
  bool logResponseBody;

  /// Print error message
  bool error;

  /// Log size per print
  final int logSize;

  LoggingInterceptor({
    this.logRequest = true,
    this.logRequestHeaders = true,
    this.logRequestBody = true,
    this.logResponse = true,
    this.logResponseHeaders = true,
    this.logResponseBody = true,
    this.error = true,
    this.logSize = 512,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra['start'] = DateTime.now();

    if (logRequest) {
      var buffer = StringBuffer();
      buffer.writeln('--> ${options.method} ${options.uri}');

      if (logRequestHeaders) {
        options.headers.forEach((key, v) => buffer.writeln('$key: $v'));
        buffer.writeln('');
      }

      if (logRequestBody) {
        if (options.data != null) {
          buffer.writeln(_stringify(options.data));
        }
      }

      buffer.writeln('--> ${options.method}');
      Log.d(tag: 'http', msg: buffer.toString());
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final start = response.requestOptions.extra['start'];
    final duration = DateTime.now().difference(start);
    if (logResponse) {
      var buffer = StringBuffer();

      buffer.writeln(
          '<-- ${response.statusCode} ${response.statusMessage} '
              '${response.realUri} (${duration.inMilliseconds}ms)');

      if (logResponseHeaders) {
        response.headers.forEach((key, v) => buffer.writeln('$key: $v'));
        buffer.writeln('');
      }

      if (logResponseBody && response.data != null) {
        buffer.writeln(_stringify(response.data));
      }

      buffer.writeln('<-- END HTTP');
      Log.d(tag: 'http', msg: buffer.toString());
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log.e(tag: 'http', msg: '<-- HTTP FAILED: $err');
    super.onError(err, handler);
  }

  String? _stringify(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = const JsonEncoder.withIndent('  ');
      return encoder.convert(message);
    } else {
      if (message is String) {
        return message;
      } else {
        return message.toString();
      }
    }
  }
}
