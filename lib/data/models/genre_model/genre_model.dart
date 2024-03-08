import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel {
  @JsonKey()
  final String name;

  GenreModel({
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return _$GenreModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenreModelToJson(this);
  }
}