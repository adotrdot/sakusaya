import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sakusaya/db.dart';

class SksyHome extends StatefulWidget {
  const SksyHome({super.key});

  @override
  State<SksyHome> createState() => _SksyHomeState();
}

class _SksyHomeState extends State<SksyHome> {
  final totalMoneyController = TextEditingController();

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
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: SksysDatabase.boxPocket!.listenable(keys: ['totalMoney']),
                  builder: (context, box, widget) {
                    return Text('Pocket Money: ${box.get('totalMoney', defaultValue: 0)}');
                  }
                ),
              ],
            ),
            const Row(
              children: [
                Text('Expenses'),
              ],
            ),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: SksysDatabase.boxExpenses!.listenable(keys: ['foodDrink']),
                  builder: (context, box, widget) {
                    return Text('Food & Drink: ${box.get('foodDrink', defaultValue: 0)}');
                  }
                ),
              ],
            ),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: SksysDatabase.boxExpenses!.listenable(keys: ['transport']),
                  builder: (context, box, widget) {
                    return Text('Transportation: ${box.get('transport', defaultValue: 0)}');
                  }
                ),
              ],
            ),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: SksysDatabase.boxExpenses!.listenable(keys: ['rent']),
                  builder: (context, box, widget) {
                    return Text('Rent: ${box.get('rent', defaultValue: 0)}');
                  }
                ),
              ],
            ),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: SksysDatabase.boxExpenses!.listenable(keys: ['entertain']),
                  builder: (context, box, widget) {
                    return Text('Entertainment: ${box.get('entertain', defaultValue: 0)}');
                  }
                ),
              ],
            ),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: SksysDatabase.boxExpenses!.listenable(keys: ['others']),
                  builder: (context, box, widget) {
                    return Text('Others: ${box.get('others', defaultValue: 0)}');
                  }
                ),
              ],
            ),
            const Text('Income Sources'),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Edit Allocation')
            ),
          ],
        ),
      ),
    );
  }

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pocket Money'),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: totalMoneyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter amount',
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                int newValue = 0;
                try {
                  newValue = int.parse(totalMoneyController.text);
                } catch(e) {
                  newValue = 0;
                }
                SksysDatabase.boxPocket!.put('totalMoney', newValue);
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}