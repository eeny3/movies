import 'package:json_annotation/json_annotation.dart';

part 'premiere_model.g.dart';

@JsonSerializable()
class PremiereModel {
  @JsonKey()
  final String? world;

  PremiereModel({
    required this.world,
  });

  factory PremiereModel.fromJson(Map<String, dynamic> json) {
    return _$PremiereModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PremiereModelToJson(this);
  }
}