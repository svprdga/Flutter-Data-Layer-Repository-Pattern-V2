import 'package:flutter/material.dart';
import 'package:flutter_data_layer_repository_pattern_v2/domain/recipe.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetails({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 24.0,
            right: 16.0,
            bottom: 24.0,
          ),
          child: Text(recipe.description),
        ),
      ),
    );
  }
}
