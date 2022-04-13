import 'package:json_annotation/json_annotation.dart';

part 'recipe_entity.g.dart';

@JsonSerializable()
class RecipeListResponse {
  final int count;
  final List<RecipeEntity> results;

  RecipeListResponse({required this.count, required this.results});

  factory RecipeListResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeListResponseFromJson(json);
}

@JsonSerializable()
class RecipeEntity {
  final int id;
  final String name;
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;
  final String description;

  RecipeEntity({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.description,
  });

  factory RecipeEntity.fromJson(Map<String, dynamic> json) =>
      _$RecipeEntityFromJson(json);
}
