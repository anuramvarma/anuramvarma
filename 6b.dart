import 'package:flutter/material.dart';

void main() => runApp(const ThemedApp());

class ThemedApp extends StatefulWidget {
  const ThemedApp({super.key});
  @override
  State<ThemedApp> createState() => _ThemedAppState();
}

class _ThemedAppState extends State<ThemedApp> {
  int _i = 0;
  final _themes = [
    {
      "n": "Light",
      "t": ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
    },
    {
      "n": "Dark",
      "t": ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
    },
    {
      "n": "Blue",
      "t": ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade50,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.blue)),
      ),
    },
    {
      "n": "Green",
      "t": ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green.shade50,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.green)),
      ),
    },
  ];

  void _next() => setState(() => _i = (_i + 1) % _themes.length);

  @override
  Widget build(BuildContext context) {
    final c = _themes[_i];
    final theme = c["t"] as ThemeData;
    final current = c["n"];
    final next = _themes[(_i + 1) % _themes.length]["n"];
    return MaterialApp(
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
              ElevatedButton(onPressed: _next, child: Text('Change to $next')),
              const SizedBox(height: 10),
              Text(
                'Current Theme: $current',
                style: TextStyle(color: theme.textTheme.bodyMedium?.color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
