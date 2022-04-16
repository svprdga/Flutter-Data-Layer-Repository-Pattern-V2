import 'package:flutter_data_layer_repository_pattern_v2/data/database/dao/base_dao.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/database/entity/recipe_db_entity.dart';

class RecipeDao extends BaseDao {
  Future<List<RecipeDbEntity>> selectAll() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(BaseDao.recipeTableName);
    return List.generate(maps.length, (i) => RecipeDbEntity.fromMap(maps[i]));
  }

  Future<void> insertAll(List<RecipeDbEntity> assets) async {
    final db = await getDatabase();
    final batch = db.batch();

    for (final asset in assets) {
      batch.insert(BaseDao.recipeTableName, asset.toMap());
    }

    await batch.commit();
  }
}
