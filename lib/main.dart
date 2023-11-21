import 'package:flutter/material.dart';
import 'package:wallpaper/views/home.dart';
import 'package:wallpaper/views/image.dart';
import 'package:wallpaper/views/login.dart';
import 'package:wallpaper/views/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WallPaper Hub',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage());
  }
}
