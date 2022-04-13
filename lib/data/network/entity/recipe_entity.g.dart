// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeListResponse _$RecipeListResponseFromJson(Map<String, dynamic> json) =>
    RecipeListResponse(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => RecipeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeListResponseToJson(RecipeListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };

RecipeEntity _$RecipeEntityFromJson(Map<String, dynamic> json) => RecipeEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      thumbnailUrl: json['thumbnail_url'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$RecipeEntityToJson(RecipeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail_url': instance.thumbnailUrl,
      'description': instance.description,
    };
