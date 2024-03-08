import 'package:app_fox_movies/data/models/fees_model/fees_model.dart';
import 'package:app_fox_movies/data/models/genre_model/genre_model.dart';
import 'package:app_fox_movies/data/models/person_model/person_model.dart';
import 'package:app_fox_movies/data/models/poster_model/poster_model.dart';
import 'package:app_fox_movies/data/models/premiere_model/premiere_model.dart';
import 'package:app_fox_movies/data/models/rating_model/rating_model.dart';
import 'package:app_fox_movies/data/models/videos_model/videos_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_info_model.g.dart';

@JsonSerializable()
class MovieInfoModel {

  @JsonKey()
  final String? name;

  @JsonKey()
  final String? shortDescription;

  @JsonKey()
  final String? description;

  @JsonKey()
  final RatingModel? rating;

  @JsonKey()
  final PosterModel backdrop;

  @JsonKey()
  final int? year;

  @JsonKey()
  final int? ageRating;

  @JsonKey()
  final RatingModel? votes;

  @JsonKey()
  final List<GenreModel> genres;

  @JsonKey()
  final FeesModel fees;

  @JsonKey()
  final PremiereModel premiere;

  @JsonKey()
  final List<PersonModel> persons;

  @JsonKey()
  final VideosModel? videos;


  MovieInfoModel({
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.rating,
    required this.backdrop,
    required this.year,
    required this.ageRating,
    required this.votes,
    required this.genres,
    required this.fees,
    required this.premiere,
    required this.persons,
    required this.videos,
  });

  factory MovieInfoModel.fromJson(Map<String, dynamic> json) {
    return _$MovieInfoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieInfoModelToJson(this);
  }
}