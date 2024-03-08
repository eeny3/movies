import 'package:app_fox_movies/data/models/movie_info_model/movie_info_model.dart';
import 'package:app_fox_movies/data/models/movie_preview_model/movie_preview_model.dart';
import 'package:app_fox_movies/services/networking/client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieRepository {
  final RestClient _client;

  MovieRepository(this._client);

  Future<MovieInfoModel> getMovie(
    int id,
  ) async {
    try {
      final result = await _client.movie(id);
      return result;
    } catch (e, stacktrace) {
      //TODO add error handling
      print(stacktrace);
      throw e;
    }
  }

  Future<List<MoviePreviewModel>> searchMovies(
    int page,
    int limit,
    String query,
  ) async {
    try {
      final result = await _client.search(page, limit, query);
      return result.docs;
    } catch (e, stacktrace) {
      //TODO add error handling
      print(stacktrace);
      throw e;
    }
  }
}
