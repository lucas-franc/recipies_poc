import 'package:flutter/material.dart';
import 'package:recipe_poc/src/models/recipe.dart';
import 'package:recipe_poc/src/views/recipe/recipe_ingredients_view.dart';

class RecipeSummary extends StatefulWidget {
  final Recipe recipe;
  const RecipeSummary({super.key, required this.recipe});

  @override
  State<RecipeSummary> createState() => _RecipeSummaryState();
}

class _RecipeSummaryState extends State<RecipeSummary> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeIngredientsView(
              recipe: widget.recipe,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.recipe.recipeName.toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade900),
            ),
            Icon(
              Icons.chevron_right,
              size: 48,
              color: Colors.orange.shade900,
            )
          ],
        ),
      ),
    );
  }
}
