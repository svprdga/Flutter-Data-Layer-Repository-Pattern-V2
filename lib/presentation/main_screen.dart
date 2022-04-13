import 'package:flutter/material.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/repository/recipe_repository.dart';
import 'package:flutter_data_layer_repository_pattern_v2/domain/recipe.dart';
import 'package:flutter_data_layer_repository_pattern_v2/presentation/recipe_details.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data layer sample')),
      body: FutureBuilder<List<Recipe>>(
        future: Provider.of<RecipeRepository>(context).getRecipes(),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final recipe = snapshot.data![index];

                return ListTile(
                  leading: SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: ClipOval(
                      child: Image.network(recipe.thumbnailUrl),
                    ),
                  ),
                  title: Text(recipe.name),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetails(recipe: recipe),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            Provider.of<Logger>(context)
                .e('Error while fetching data: ${snapshot.error.toString()}');
            return const Center(
              child: Text('An error occurred while fetching data.'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
