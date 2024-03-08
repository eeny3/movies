import 'package:app_fox_movies/data/models/movie_preview_model/movie_preview_model.dart';
import 'package:app_fox_movies/repositories/movie_repository.dart';
import 'package:app_fox_movies/services/connection/connection_status.dart';
import 'package:app_fox_movies/services/storage/db_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'favourites_page_store.g.dart';

@injectable
class FavouritesPageStore = FavouritesPageStoreBase with _$FavouritesPageStore;

abstract class FavouritesPageStoreBase with Store {
  final MovieRepository _movieRepository;
  final DBHelper storage = GetIt.I();
  final db = FirebaseFirestore.instance;
  final ConnectionStatusSingleton connectionStatusSingleton = GetIt.I();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<MoviePreviewModel> movies = ObservableList();

  FavouritesPageStoreBase(this._movieRepository);

  @action
  getFavourites() async {
    isLoading = true;

    if (!connectionStatusSingleton.hasConnection) {
      final favourites = await storage.getFavourites();
      for (var favourite in favourites) {
        final MoviePreviewModel movie =
            MoviePreviewModel.fromStorageMap(favourite);
        movies.add(movie);
      }
    } else {
      await db.collection("favourites").get().then((event) {
        for (var doc in event.docs) {
          final MoviePreviewModel movie =
              MoviePreviewModel.fromStorageMap(doc.data());
          movies.add(movie);
        }
      });
    }

    isLoading = false;
  }

  @action
  deleteFavourite(int index) async {
    isLoading = true;

    await storage.deleteFavourite(movies[index].id);
    if (!connectionStatusSingleton.hasConnection) {
      await storage.insertPending(movies[index]);
    } else {
      await db
          .collection("favourites")
          .doc(
            movies[index].id.toString(),
          )
          .delete();
    }

    movies.removeAt(index);
    isLoading = false;
  }
}
