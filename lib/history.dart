import 'package:flutter/material.dart';

class SksyHistory extends StatelessWidget {
  const SksyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('History'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('This is History'),
          ],
        ),
      ),
    );
  }
}