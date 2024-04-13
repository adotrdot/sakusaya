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
            const Text('Total amount: 0'),
            const Text('Alokasi'),
            const Text('Makan & Minum: 0'),
            const Text('Transportasi: 0'),
            const Text('Kontrakan: 0'),
            const Text('Hiburan: 0'),
            const Text('Lain-lain: 0'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Edit Alokasi')
            ),
          ],
        ),
      ),
    );
  }
}