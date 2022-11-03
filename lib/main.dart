import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

import 'models/meal.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();

  List<Meal> _avaiableMeals = dummyMeals;
  List<Meal> _favouriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(
      () {
        this.settings = settings;

        _avaiableMeals = dummyMeals.where(
          (meal) {
            final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
            final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
            final filtervegan = settings.isVegan && !meal.isVegan;
            final filterVegetarian =
                settings.isVegetarian && !meal.isVegetarian;

            return !filterGluten &&
                !filterLactose &&
                !filtervegan &&
                !filterVegetarian;
          },
        ).toList();
      },
    );
  }

  void _toggleFavourite(Meal meal) {
    setState(
      () {
        _favouriteMeals.contains(meal)
            ? _favouriteMeals.remove(meal)
            : _favouriteMeals.add(meal);
      },
    );
  }

  bool _isFavourite(Meal meal) {
    return _favouriteMeals.contains(meal);
  }

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
        AppRoutes.home: (ctx) => TabsScrenn(favouriteMeals: _favouriteMeals),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(meals: _avaiableMeals),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(
            onToggleFavourite: _toggleFavourite, isFavourite: _isFavourite),
        AppRoutes.settings: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            )
      },
    );
  }
}
