//import packages
import 'package:flutter/material.dart';
//stateless widget for mealIteamTrait
class MealItemTrait extends StatelessWidget {
   // Constructor for the MealItemTrait widget
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });
//Icon to display for the trait
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
     // The build method creates the widget's UI
    return Row(
      children: [
         //Display the icon with a fixed size and white color 
        Icon(icon, size: 17, color: Colors.white,),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.white),),
      ],
    );
  }
}
