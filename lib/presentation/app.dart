import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/database/dao/asset_dao.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/mapper.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/network/client/api_client.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/repository/recipe_repository.dart';
import 'package:flutter_data_layer_repository_pattern_v2/presentation/main_screen.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Logger>(
          create: (_) => Logger(
            printer: PrettyPrinter(),
            level: kDebugMode ? Level.verbose : Level.nothing,
          ),
        ),
        Provider<RecipeRepository>(
          create: (_) => RecipeRepository(
            apiClient:
                ApiClient(baseUrl: 'tasty.p.rapidapi.com', apiKey: apiKey),
            mapper: Mapper(),
            recipeDao: RecipeDao(),
          ),
        ),
      ],
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
