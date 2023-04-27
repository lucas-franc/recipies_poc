import 'package:recipe_poc/src/models/ingredient.dart';
import 'package:recipe_poc/src/models/step.dart';

class Recipe {
  String? recipeName;
  List<Step>? recipeSteps;
  List<Ingredient>? recipeIngredients;

  Recipe({this.recipeName, this.recipeIngredients, this.recipeSteps});

  factory Recipe.fromJson(Map<String, dynamic> parsedJson) {
    var listSteps = parsedJson['recipeSteps'] as List;
    List<Step> steps = listSteps.map((step) => Step.fromJson(step)).toList();
    var listIngredients = parsedJson['recipeIngredients'] as List;
    List<Ingredient> ingredients = listIngredients
        .map((ingredient) => Ingredient.fromJson(ingredient))
        .toList();
    return Recipe(
      recipeName: parsedJson['recipeName'],
      recipeIngredients: ingredients,
      recipeSteps: steps,
    );
  }
}
