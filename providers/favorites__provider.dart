import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
//A custom StateNotifier that manages a list of favorite meals
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // Constructor initializes the list of favorite meals as an empty list
  FavoriteMealsNotifier() : super([]);

  //Method to toggle the favorite status of a meal
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}
// A riverport provider that exposes the FavoriteMealNotifers and its state
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
