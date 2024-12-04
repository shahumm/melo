import 'package:flutter/material.dart';
import 'screens/mood_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _currentTheme = ThemeData.light();

  final Map<String, ThemeData> moodThemes = {
    "Happy": ThemeData(
      primaryColor: Colors.blue,
      colorScheme: const ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.yellow,
      ),
      scaffoldBackgroundColor: Colors.lightBlue[50],
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.blue)),
    ),
    "Sad": ThemeData(
      primaryColor: Colors.blueGrey,
      colorScheme: const ColorScheme.light(
        primary: Colors.blueGrey,
        secondary: Colors.deepPurple,
      ),
      scaffoldBackgroundColor: Colors.blueGrey[50],
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.blueGrey)),
    ),
    "Relaxed": ThemeData(
      primaryColor: Colors.green,
      colorScheme: const ColorScheme.light(
        primary: Colors.green,
        secondary: Colors.teal,
      ),
      scaffoldBackgroundColor: Colors.green[50],
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.green)),
    ),
    "Energetic": ThemeData(
      primaryColor: Colors.orange,
      colorScheme: const ColorScheme.light(
        primary: Colors.orange,
        secondary: Colors.yellow,
      ),
      scaffoldBackgroundColor: Colors.orange[50],
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.orange)),
    ),
    "Angry": ThemeData(
      primaryColor: Colors.red,
      colorScheme: const ColorScheme.light(
        primary: Colors.red,
        secondary: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.red[50],
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.red)),
    ),
  };

  void updateTheme(String mood) {
    setState(() {
      _currentTheme = moodThemes[mood] ?? ThemeData.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Theme App',
      theme: _currentTheme,
      home: MoodSelectionScreen(updateTheme: updateTheme),
    );
  }
}
