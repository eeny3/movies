import 'package:json_annotation/json_annotation.dart';

part 'fee_model.g.dart';

@JsonSerializable()
class FeeModel {
  @JsonKey()
  final int? value;

  @JsonKey()
  final String? currency;

  FeeModel({
    required this.value,
    required this.currency,
  });

  factory FeeModel.fromJson(Map<String, dynamic> json) {
    return _$FeeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FeeModelToJson(this);
  }
}