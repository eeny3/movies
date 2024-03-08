import 'package:app_fox_movies/data/models/movie_info_model/movie_info_model.dart';
import 'package:app_fox_movies/data/models/movie_preview_model/movie_preview_model.dart';
import 'package:app_fox_movies/data/models/movie_search_result_model/movie_search_result_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'client.g.dart';

@lazySingleton
@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @factoryMethod
  static RestClient create(Dio dio) {
    return RestClient(dio);
  }

  @GET("/movie/search")
  Future<MovieSearchResultModel> search(
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('query') String query,
  );

  @GET("/movie/{id}")
  Future<MovieInfoModel> movie(
    @Path('id') int id,
  );
}
