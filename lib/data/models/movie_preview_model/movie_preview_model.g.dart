// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviePreviewModel _$MoviePreviewModelFromJson(Map<String, dynamic> json) =>
    MoviePreviewModel(
      id: json['id'] as int,
      name: json['name'] as String,
      shortDescription: json['shortDescription'] as String,
      rating: RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      poster: PosterModel.fromJson(json['poster'] as Map<String, dynamic>),
      posterBytes: const Uint8ListConverter()
          .fromJson(json['posterBytes'] as List<int>?),
    );

Map<String, dynamic> _$MoviePreviewModelToJson(MoviePreviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'rating': instance.rating,
      'poster': instance.poster,
      'posterBytes': const Uint8ListConverter().toJson(instance.posterBytes),
    };
