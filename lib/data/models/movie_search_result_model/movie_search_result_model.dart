import 'package:app_fox_movies/data/models/movie_preview_model/movie_preview_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_search_result_model.g.dart';

@JsonSerializable()
class MovieSearchResultModel {
  @JsonKey()
  final List<MoviePreviewModel> docs;

  @JsonKey()
  final int total;

  @JsonKey()
  final int page;

  @JsonKey()
  final int limit;

  @JsonKey()
  final int pages;


  MovieSearchResultModel({
    required this.docs,
    required this.total,
    required this.page,
    required this.limit,
    required this.pages,
  });

  factory MovieSearchResultModel.fromJson(Map<String, dynamic> json) {
    return _$MovieSearchResultModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieSearchResultModelToJson(this);
  }
}