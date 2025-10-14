import 'package:flutter/material.dart';
void main() => runApp(const ThemedApp());
class ThemedApp extends StatefulWidget {
  const ThemedApp({super.key});
  @override
  State<ThemedApp> createState() => _ThemedAppState();
}
class _ThemedAppState extends State<ThemedApp> {
  int _index = 0;

  final _themes = [
    {
      "name": "Light",
      "theme": ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
    },
    {
      "name": "Dark",
      "theme": ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
    },
    {
      "name": "Blue",
      "theme": ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blueAccent.shade100,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.blue),
        ),
      ),
    },
    {
      "name": "Green",
      "theme": ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.greenAccent.shade100,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.green),
        ),
      ),
    },
  ];

  void _nextTheme() => setState(() => _index = (_index + 1) % _themes.length);

  @override
  Widget build(BuildContext context) {
    final current = _themes[_index];
    final theme = current["theme"] as ThemeData;
    final name = current["name"];

    return MaterialApp(
      title: 'Theme Demo',
      theme: theme,
      home: Scaffold(
        appBar: AppBar(title: const Text('Theme Switcher'), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello Flutter!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyMedium?.color,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _nextTheme,
                child: Text('Change Theme ($name)'),
              ),
              const SizedBox(height: 10),
              Text(
                'Current Theme: $name',
                style: TextStyle(color: theme.textTheme.bodyMedium?.color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
