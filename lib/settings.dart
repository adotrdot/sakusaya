import 'package:flutter/material.dart';

class SksySettings extends StatelessWidget {
  const SksySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Settings'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('This is Settings'),
          ],
        ),
      ),
    );
  }
}