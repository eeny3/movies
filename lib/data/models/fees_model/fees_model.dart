import 'package:app_fox_movies/data/models/fee_model/fee_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fees_model.g.dart';

@JsonSerializable()
class FeesModel {
  @JsonKey()
  final FeeModel world;

  FeesModel({
    required this.world,
  });

  factory FeesModel.fromJson(Map<String, dynamic> json) {
    return _$FeesModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FeesModelToJson(this);
  }
}