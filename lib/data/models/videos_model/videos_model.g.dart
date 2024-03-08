// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideosModel _$VideosModelFromJson(Map<String, dynamic> json) => VideosModel(
      trailers: (json['trailers'] as List<dynamic>?)
          ?.map((e) => TrailerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideosModelToJson(VideosModel instance) =>
    <String, dynamic>{
      'trailers': instance.trailers,
    };
