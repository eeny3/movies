// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSearchResultModel _$MovieSearchResultModelFromJson(
        Map<String, dynamic> json) =>
    MovieSearchResultModel(
      docs: (json['docs'] as List<dynamic>)
          .map((e) => MoviePreviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      page: json['page'] as int,
      limit: json['limit'] as int,
      pages: json['pages'] as int,
    );

Map<String, dynamic> _$MovieSearchResultModelToJson(
        MovieSearchResultModel instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'pages': instance.pages,
    };
