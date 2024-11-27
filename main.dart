//import necessary packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//themedata for color
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  //Entry point
  runApp(const ProviderScope(
    child: App(),
  ));
}
//Define the main app widget
class App extends StatelessWidget {
  const App({super.key}); // Stateless widget constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme, // Apply the custom theme to the app
      home: const TabsScreen(), // Set the initial screen to the TabScreen widget
    );
  }
}
