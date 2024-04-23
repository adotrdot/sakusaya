import 'package:flutter/material.dart';
import 'package:sakusaya/routing/navigator.dart';
import 'package:sakusaya/db.dart';

void main() {
  // Run app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<bool> _loadedDB = SksyDatabase.initDB();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadedDB,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp.router(
            title: 'sakusaya',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
              useMaterial3: true,
            ),
            routerConfig: goRouter,
          );
        } else {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}