import 'package:app_fox_movies/data/models/movie_preview_model/movie_preview_model.dart';
import 'package:app_fox_movies/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

@lazySingleton
class HomePageStore = HomePageStoreBase with _$HomePageStore;

abstract class HomePageStoreBase with Store {
  final MovieRepository _movieRepository;

  final int moviesPerPage = 10;
  int currentPage = 0;
  String currentQuery = '';

  @observable
  bool hasMore = true;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<MoviePreviewModel> movies = ObservableList();

  HomePageStoreBase(this._movieRepository);

  @action
  searchMovies(String query) async {
    if (hasMore) {
      if (currentQuery != query) {
        isLoading = true;
        movies = ObservableList();
      }

      currentPage++;
      currentQuery = query;

      final list = await _movieRepository.searchMovies(
        currentPage,
        moviesPerPage,
        query,
      );

      if (list.isEmpty) {
        hasMore = false;
      } else {
        for (var movie in list) {
          movies.add(movie);
        }
      }

      if (isLoading) {
        isLoading = false;
      }
    }
  }

  @action
  resetOnNewQuery() {
    currentPage = 0;
    hasMore = true;
  }
}
