import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}
//enum to represent different type of dietary filters
class FiltersNotifer extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifer()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });
  
  // Constructor initializes the state with all filters set to 'false' (inactive)
  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
//method to update a single filter in the state
  void setFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }
}
//method to update all filters at once with a map of chosen filters
final filtersProvider =
    StateNotifierProvider<FiltersNotifer, Map<Filter, bool>>(
  (ref) => FiltersNotifer(),
);
// Declares a provider for the FiltersNotifier to expose its state and methods
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  //Filters the meals based on the active filters
  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
      // Excludes the meal if it's not gluten-free and gluten-free filter is active

    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
