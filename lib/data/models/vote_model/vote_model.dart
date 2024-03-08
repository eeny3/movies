import 'package:json_annotation/json_annotation.dart';

part 'vote_model.g.dart';

@JsonSerializable()
class VoteModel {
  @JsonKey()
  final double kp;

  VoteModel({
    required this.kp,
  });

  factory VoteModel.fromJson(Map<String, dynamic> json) {
    return _$VoteModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VoteModelToJson(this);
  }
}