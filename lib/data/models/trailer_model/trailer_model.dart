import 'package:json_annotation/json_annotation.dart';

part 'trailer_model.g.dart';

@JsonSerializable()
class TrailerModel {
  @JsonKey()
  final String? url;

  TrailerModel({
    required this.url,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return _$TrailerModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TrailerModelToJson(this);
  }
}