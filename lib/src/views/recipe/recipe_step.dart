import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_poc/src/models/recipe.dart';

class RecipeStepView extends StatefulWidget {
  final Recipe recipe;
  const RecipeStepView({super.key, required this.recipe});

  @override
  State<RecipeStepView> createState() => _RecipeStepViewState();
}

class _RecipeStepViewState extends State<RecipeStepView> {
  int indexSteps = 0;
  List steps = [];
  List stepTimes = [];
  Timer? timer;
  int seconds = 0;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    steps = widget.recipe.recipeSteps!.map((e) => e.stepName).toList();
    stepTimes = widget.recipe.recipeSteps!.map((e) => e.timeInMinutes).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 128),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Text(
                  steps[indexSteps],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      pastStep();
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 64,
                    ),
                  ),
                  Column(
                    children: [
                      Text('$seconds'),
                      ElevatedButton(
                          onPressed: () {
                            startTimer();
                          },
                          child: const Text('Start')),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      nextStep();
                    },
                    icon: const Icon(
                      Icons.chevron_right,
                      size: 64,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void nextStep() {
    setState(() {
      if (indexSteps < (steps.length - 1)) {
        indexSteps++;
      }
      seconds = int.parse(stepTimes[indexSteps]);
    });
  }

  void pastStep() {
    setState(() {
      if (indexSteps > 0) {
        indexSteps = indexSteps - 1;
      }
      seconds = int.parse(stepTimes[indexSteps]);
    });
  }
}
