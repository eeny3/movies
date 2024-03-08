import 'dart:typed_data';

import 'package:app_fox_movies/data/converters/uintlist_converter.dart';
import 'package:app_fox_movies/data/models/poster_model/poster_model.dart';
import 'package:app_fox_movies/data/models/rating_model/rating_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_preview_model.g.dart';

@JsonSerializable()
class MoviePreviewModel {
  @JsonKey()
  final int id;

  @JsonKey()
  final String name;

  @JsonKey()
  final String shortDescription;

  @JsonKey()
  final RatingModel rating;

  @JsonKey()
  final PosterModel poster;

  @Uint8ListConverter()
  Uint8List? posterBytes;

  MoviePreviewModel({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.rating,
    required this.poster,
    this.posterBytes,
  });

  factory MoviePreviewModel.fromJson(Map<String, dynamic> json) {
    return _$MoviePreviewModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MoviePreviewModelToJson(this);
  }

  factory MoviePreviewModel.fromStorageMap(Map<String, dynamic> map) {
    return MoviePreviewModel(
      id: map['id'] as int,
      name: map['name'] as String,
      shortDescription: map['shortDescription'] as String,
      rating: RatingModel.fromJson(
        {
          'kp': map['rating'],
        },
      ),
      poster: PosterModel.fromJson(
        {
          'previewUrl': map['poster'],
        },
      ),
      posterBytes: map['posterBytes'] as Uint8List?,
    );
  }

  Map<String, dynamic> toStorageMap() {
    final Map<String, dynamic> storageMap = {
      'id': id,
      'name': name,
      'shortDescription': shortDescription,
      'rating': rating.kp,
      'poster': poster.previewUrl,
      'posterBytes': posterBytes,
    };
    return storageMap;
  }
}
