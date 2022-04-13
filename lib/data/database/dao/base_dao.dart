import 'package:flutter/widgets.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/database/entity/recipe_db_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDao {
  static const databaseName = 'data-layer-sample-v2.db';

  static const recipeTableName = 'recipe';

  @protected
  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createRecipeTable(batch);
        await batch.commit();
      },
      version: 1,
    );
  }

  void _createRecipeTable(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE $recipeTableName(
      ${RecipeDbEntity.fieldId} INTEGER PRIMARY KEY NOT NULL,
      ${RecipeDbEntity.fieldName} TEXT NOT NULL,
      ${RecipeDbEntity.fieldThumbnailUrl} TEXT NOT NULL,
      ${RecipeDbEntity.fieldDescription} TEXT NOT NULL
      );
      ''',
    );
  }
}
