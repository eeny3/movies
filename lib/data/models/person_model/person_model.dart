import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  @JsonKey()
  final int id;

  @JsonKey()
  final String? photo;

  @JsonKey()
  final String? name;

  PersonModel({
    required this.id,
    required this.photo,
    required this.name,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return _$PersonModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PersonModelToJson(this);
  }
}