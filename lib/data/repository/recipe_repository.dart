import 'package:flutter_data_layer_repository_pattern_v2/data/database/dao/asset_dao.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/mapper.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/network/client/api_client.dart';
import 'package:flutter_data_layer_repository_pattern_v2/domain/recipe.dart';

class RecipeRepository {
  final ApiClient apiClient;
  final Mapper mapper;
  final RecipeDao recipeDao;

  RecipeRepository({
    required this.apiClient,
    required this.mapper,
    required this.recipeDao,
  });

  Future<List<Recipe>> getRecipes() async {
    // First, try to fetch the recipes from database
    final dbEntities = await recipeDao.selectAll();

    if (dbEntities.isNotEmpty) {
      return mapper.toRecipesFromDb(dbEntities);
    }

    // If the database is empty, fetch from the API, saved it to database,
    // and return it to the caller
    final response = await apiClient.getRecipes();
    final recipes = mapper.toRecipes(response.results);

    await recipeDao.insertAll(mapper.toRecipesDbEntity(recipes));

    return recipes;
  }
}
