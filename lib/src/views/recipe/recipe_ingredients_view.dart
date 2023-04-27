import 'package:flutter/material.dart';
import 'package:recipe_poc/src/models/recipe.dart';
import 'package:recipe_poc/src/views/recipe/recipe_step.dart';

class RecipeIngredientsView extends StatefulWidget {
  final Recipe recipe;
  const RecipeIngredientsView({super.key, required this.recipe});

  @override
  State<RecipeIngredientsView> createState() => _RecipeIngredientsViewState();
}

class _RecipeIngredientsViewState extends State<RecipeIngredientsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Text(
                  widget.recipe.recipeName.toString().toUpperCase(),
                  style: const TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                itemCount: widget.recipe.recipeIngredients!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Visibility(
                          visible: widget.recipe.recipeIngredients![index]
                              .ingredientQuantity
                              .toString()
                              .contains('.5'),
                          replacement: Text(
                            widget.recipe.recipeIngredients![index]
                                .ingredientQuantity
                                .toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          child: Visibility(
                            visible: widget.recipe.recipeIngredients![index]
                                .ingredientQuantity
                                .toString()
                                .startsWith('0.'),
                            replacement: Text(
                              "${widget.recipe.recipeIngredients![index].ingredientQuantity.toString().substring(0, 1)}½",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            child: const Text(
                              '½',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            widget
                                .recipe.recipeIngredients![index].ingredientName
                                .toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeStepView(
                          recipe: widget.recipe,
                        ),
                      ),
                    );
                  },
                  child: const Text("COMEÇAR"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
