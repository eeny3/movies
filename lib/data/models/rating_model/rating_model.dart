import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  @JsonKey()
  final double? kp;

  RatingModel({
    required this.kp,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return _$RatingModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RatingModelToJson(this);
  }
}