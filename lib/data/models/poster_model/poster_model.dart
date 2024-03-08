import 'package:json_annotation/json_annotation.dart';

part 'poster_model.g.dart';

@JsonSerializable()
class PosterModel {
  @JsonKey()
  final String? url;

  @JsonKey()
  final String? previewUrl;

  PosterModel({
    required this.url,
    required this.previewUrl,
  });

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return _$PosterModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PosterModelToJson(this);
  }
}