import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Raleway',
      primarySwatch: Colors.pink,
      canvasColor: const Color.fromRGBO(255, 255, 229, 1),
      textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily: "RobotoCondensed",
            ),
            titleLarge: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
            ),
          ),
    );
    return MaterialApp(
      title: "Meals app",
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.amber,
        ),
      ),
      routes: {
        AppRoutes.home: (context) => const CategoriesScreen(),
        AppRoutes.categoriesMeals: (context) => CategoriesMealsScreen(),
        AppRoutes.mealDetail: (context) => MealDetailScreen(),
      },
    );
  }
}
