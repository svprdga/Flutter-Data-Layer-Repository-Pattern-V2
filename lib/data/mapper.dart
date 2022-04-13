import 'package:flutter_data_layer_repository_pattern_v2/data/database/entity/recipe_db_entity.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/network/entity/recipe_entity.dart';
import 'package:flutter_data_layer_repository_pattern_v2/domain/recipe.dart';

class MapperException<From, To> implements Exception {
  final String message;

  const MapperException(this.message);

  @override
  String toString() {
    return 'Error when mapping class $From to $To: $message}';
  }
}

class Mapper {
  Recipe toRecipe(RecipeEntity entity) {
    try {
      return Recipe(
        id: entity.id,
        name: entity.name,
        thumbnailUrl: entity.thumbnailUrl,
        description: entity.description,
      );
    } catch (e) {
      throw MapperException<RecipeEntity, Recipe>(e.toString());
    }
  }

  List<Recipe> toRecipes(List<RecipeEntity> entities) {
    final List<Recipe> recipes = [];

    for (final entity in entities) {
      recipes.add(toRecipe(entity));
    }

    return recipes;
  }

  Recipe toRecipeFromDb(RecipeDbEntity entity) {
    try {
      return Recipe(
        id: entity.id,
        name: entity.name,
        thumbnailUrl: entity.thumbnailUrl,
        description: entity.description,
      );
    } catch (e) {
      throw MapperException<RecipeDbEntity, Recipe>(e.toString());
    }
  }

  List<Recipe> toRecipesFromDb(List<RecipeDbEntity> entities) {
    final List<Recipe> recipes = [];

    for (final entity in entities) {
      recipes.add(toRecipeFromDb(entity));
    }

    return recipes;
  }

  RecipeDbEntity toRecipeDbEntity(Recipe recipe) {
    try {
      return RecipeDbEntity(
        id: recipe.id,
        name: recipe.name,
        thumbnailUrl: recipe.thumbnailUrl,
        description: recipe.description,
      );
    } catch (e) {
      throw MapperException<Recipe, RecipeDbEntity>(e.toString());
    }
  }

  List<RecipeDbEntity> toRecipesDbEntity(List<Recipe> entities) {
    final List<RecipeDbEntity> list = [];

    for (final entity in entities) {
      list.add(toRecipeDbEntity(entity));
    }

    return list;
  }
}
