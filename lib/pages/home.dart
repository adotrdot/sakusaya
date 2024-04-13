import 'package:flutter/material.dart';

class SksyHome extends StatelessWidget {
  const SksyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Pocket Money: 0'),
            const Text('Allocation'),
            const Text('Food & Drink: 0'),
            const Text('Transportation: 0'),
            const Text('Rent: 0'),
            const Text('Entertainment: 0'),
            const Text('Others: 0'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Edit Allocation')
            ),
          ],
        ),
      ),
    );
  }
}