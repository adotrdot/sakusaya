import 'package:flutter/material.dart';
import 'package:sakusaya/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'sakusaya',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
    // return MaterialApp(
    //   title: 'sakusaya',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
    //     useMaterial3: true,
    //   ),
    //   home: const SksyNavigator(),
    // );
  }
}