import 'package:flutter/material.dart';
import 'screens/map_screen.dart';
import 'screens/line_screen.dart';
import 'screens/card_screen.dart';
import 'screens/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CityFlow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MapScreen(),
        '/line1': (context) => const LineScreen(lineNumber: 1),
        '/line2': (context) => const LineScreen(lineNumber: 2),
        '/line3': (context) => const LineScreen(lineNumber: 3),
        '/cards': (context) => const CardScreen(),
        '/news': (context) => const NewsScreen(),
      },
    );
  }
}

