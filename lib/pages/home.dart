import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SksyHome extends StatefulWidget {
  const SksyHome({super.key});

  @override
  State<SksyHome> createState() => _SksyHomeState();
}

class _SksyHomeState extends State<SksyHome> {
  var box = Hive.box('pocket');

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
            Text('Pocket Money: ${box.get('totalMoney', defaultValue: 0)}'),
            const Text('Allocation'),
            Text('Food & Drink: ${box.get('foodDrink', defaultValue: 0)}'),
            Text('Transportation: ${box.get('transport', defaultValue: 0)}'),
            Text('Rent: ${box.get('rent', defaultValue: 0)}'),
            Text('Entertainment: ${box.get('entertain', defaultValue: 0)}'),
            Text('Others: ${box.get('others', defaultValue: 0)}'),
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