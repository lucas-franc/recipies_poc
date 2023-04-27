import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_poc/src/models/recipe.dart';
import 'package:recipe_poc/src/views/widgets/recipe_summary.dart';

class RecipiesView extends StatefulWidget {
  const RecipiesView({super.key});

  @override
  State<RecipiesView> createState() => _RecipiesViewState();
}

class _RecipiesViewState extends State<RecipiesView> {
  List<Recipe> recipiesList = [];
  var database = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot>? recipeSubscription;

  @override
  void initState() {
    super.initState();

    recipeSubscription?.cancel();
    recipeSubscription =
        database.collection('recipies').snapshots().listen((snapshot) {
      final List<Recipe> recipies = snapshot.docs
          .map(
            (documentSnapshot) => Recipe.fromJson(
              documentSnapshot.data(),
            ),
          )
          .toList();
      setState(() {
        recipiesList = recipies;
      });
    });
  }

  @override
  void dispose() {
    recipeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: StreamBuilder<QuerySnapshot>(
            stream: getRecipiesList(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: documents.length.compareTo(0),
                    itemBuilder: (context, index) {
                      return RecipeSummary(
                        recipe: recipiesList[index],
                      );
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> getRecipiesList() {
    return FirebaseFirestore.instance.collection('recipies').snapshots();
  }
}
