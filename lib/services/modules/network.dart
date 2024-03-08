import 'package:app_fox_movies/services/networking/interceptors/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const _authorizationHeader = 'X-Api-Key';
const _apiKey = 'PJYCY38-3DH4G0E-GP08EZW-SP166T0';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio getDio() => Dio()
    ..options.baseUrl = 'https://api.kinopoisk.dev/v1.4'
    ..options.headers['accept'] = 'application/json'
    ..options.headers[_authorizationHeader] = _apiKey
    ..interceptors.addAll(
      [
        LoggingInterceptor(),
      ],
    );
}
