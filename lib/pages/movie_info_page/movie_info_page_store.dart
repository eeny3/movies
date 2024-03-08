import 'package:app_fox_movies/data/models/movie_info_model/movie_info_model.dart';
import 'package:app_fox_movies/pages/home_page/home_page_store.dart';
import 'package:app_fox_movies/repositories/movie_repository.dart';
import 'package:app_fox_movies/services/storage/db_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

part 'movie_info_page_store.g.dart';

@injectable
class MovieInfoPageStore = MovieInfoPageStoreBase with _$MovieInfoPageStore;

abstract class MovieInfoPageStoreBase with Store {
  final MovieRepository _movieRepository;
  final int _movieId;
  final int _movieIndex;
  YoutubePlayerController? trailerController;
  final DBHelper storage = GetIt.I();
  final db = FirebaseFirestore.instance;

  @observable
  bool isLoading = false;

  @observable
  bool isFavourite = false;

  MovieInfoModel? movieModel;

  MovieInfoPageStoreBase(
    this._movieRepository,
    this._movieId,
    this._movieIndex,
  );

  @action
  loadMovie() async {
    isLoading = true;

    final favourites = await storage.getFavourites();
    for (var favourite in favourites) {
      if(favourite['id'] == _movieId) {
        isFavourite = true;
      }
    }

    movieModel = await _movieRepository.getMovie(_movieId);
    if (movieModel?.videos?.trailers != null) {
      if (movieModel!.videos!.trailers!.isNotEmpty) {
        if (movieModel!.videos!.trailers!.first.url != null) {
          String videoId;
          videoId = YoutubePlayer.convertUrlToId(
            movieModel!.videos!.trailers!.first.url!,
          )!;
          trailerController = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            ),
          );
        }
      }
    }
    isLoading = false;
  }

  @action
  addToFavourite() async {
    if(!isFavourite) {
      isLoading = true;
      isFavourite = true;
      final HomePageStore homePageStore = GetIt.I();
      final moviePreview = homePageStore.movies[_movieIndex];

      if (moviePreview.poster.previewUrl != null) {
        var poster = await http.get(
          Uri.parse(
            moviePreview.poster.previewUrl!,
          ),
        );
        var posterBytes = poster.bodyBytes;
        moviePreview.posterBytes = posterBytes;
      }

      await storage.insertFavourite(
        moviePreview,
      );

      moviePreview.posterBytes = null;
      await db
          .collection("favourites")
          .doc(
        _movieId.toString(),
      )
          .set(
        moviePreview.toStorageMap(),
      );

      isLoading = false;
    }
  }
}
