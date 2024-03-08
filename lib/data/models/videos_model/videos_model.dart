import 'package:app_fox_movies/data/models/trailer_model/trailer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'videos_model.g.dart';

@JsonSerializable()
class VideosModel {
  @JsonKey()
  final List<TrailerModel>? trailers;

  VideosModel({
    required this.trailers,
  });

  factory VideosModel.fromJson(Map<String, dynamic> json) {
    return _$VideosModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VideosModelToJson(this);
  }
}