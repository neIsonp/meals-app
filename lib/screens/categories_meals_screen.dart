import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/components/meal_item.dart';

import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoriesMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Receitas"),
      ),
      body: ListView.builder(
        itemCount: categoriesMeals.length,
        itemBuilder: (context, index) {
          return MealItem(categoriesMeals[index]);
        },
      ),
    );
  }
}
