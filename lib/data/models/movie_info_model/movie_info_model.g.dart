// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieInfoModel _$MovieInfoModelFromJson(Map<String, dynamic> json) =>
    MovieInfoModel(
      name: json['name'] as String?,
      shortDescription: json['shortDescription'] as String?,
      description: json['description'] as String?,
      rating: json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      backdrop: PosterModel.fromJson(json['backdrop'] as Map<String, dynamic>),
      year: json['year'] as int?,
      ageRating: json['ageRating'] as int?,
      votes: json['votes'] == null
          ? null
          : RatingModel.fromJson(json['votes'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fees: FeesModel.fromJson(json['fees'] as Map<String, dynamic>),
      premiere:
          PremiereModel.fromJson(json['premiere'] as Map<String, dynamic>),
      persons: (json['persons'] as List<dynamic>)
          .map((e) => PersonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: json['videos'] == null
          ? null
          : VideosModel.fromJson(json['videos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieInfoModelToJson(MovieInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'description': instance.description,
      'rating': instance.rating,
      'backdrop': instance.backdrop,
      'year': instance.year,
      'ageRating': instance.ageRating,
      'votes': instance.votes,
      'genres': instance.genres,
      'fees': instance.fees,
      'premiere': instance.premiere,
      'persons': instance.persons,
      'videos': instance.videos,
    };
