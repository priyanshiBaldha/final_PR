import 'package:flutter/material.dart';
import 'package:joks/view/screen/homepage.dart';
import 'package:joks/view/screen/jokes_page.dart';
import 'package:joks/view/screen/splash_screen.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        'HomePage': (context) => const HomePage(),
        'jokes_page': (context) => const JokesPage(),
      },
    ),
  );
}
