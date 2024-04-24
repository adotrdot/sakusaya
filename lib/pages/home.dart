import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:io';
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
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxPocket!.listenable(keys: ['totalMoney']),
                  builder: (context, box, widget) {
                    String totalMoney = getCurrency(box.get('totalMoney', defaultValue: 0));
                    return Text('Pocket Money: $totalMoney');
                  }
                ),
                const Text('Expenses'),
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxExpenses!.listenable(keys: ['foodDrink']),
                  builder: (context, box, widget) {
                    String money = getCurrency(box.get('foodDrink', defaultValue: 0));
                    return Text('Food & Drink: $money');
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxExpenses!.listenable(keys: ['transport']),
                  builder: (context, box, widget) {
                    String money = getCurrency(box.get('transport', defaultValue: 0));
                    return Text('Transportation: $money');
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxExpenses!.listenable(keys: ['rent']),
                  builder: (context, box, widget) {
                    String money = getCurrency(box.get('rent', defaultValue: 0));
                    return Text('Rent: $money');
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxExpenses!.listenable(keys: ['entertain']),
                  builder: (context, box, widget) {
                    String money = getCurrency(box.get('entertain', defaultValue: 0));
                    return Text('Entertainment: $money');
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxExpenses!.listenable(keys: ['others']),
                  builder: (context, box, widget) {
                    String money = getCurrency(box.get('others', defaultValue: 0));
                    return Text('Others: $money');
                  }
                ),
                const Text('Income Sources'),
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxIncome!.listenable(keys: ['parents']),
                  builder: (context, box, widget) {
                    String money = getCurrency(box.get('parents', defaultValue: 0));
                    return Text('Parents: $money');
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxIncome!.listenable(keys: ['tutor']),
                  builder: (context, box, widget) {
                    String money = getCurrency(box.get('tutor', defaultValue: 0));
                    return Text('Tutor: $money');
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxIncome!.listenable(keys: ['projects']),
                  builder: (context, box, widget) {
                    String money = getCurrency(box.get('projects', defaultValue: 0));
                    return Text('Projects: $money');
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: SksyDatabase.boxIncome!.listenable(keys: ['others']),
                  builder: (context, box, widget) {
                    String money = getCurrency(box.get('others', defaultValue: 0));
                    return Text('Others: $money');
                  }
                ),
                TextButton(
                  onPressed: () {SksyDatabase.resetMoney();},
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getCurrency(int amount) {
    NumberFormat formatter;
    try {
      formatter = NumberFormat.currency(locale: Platform.localeName);
    } catch(e) {
      formatter = NumberFormat.currency(locale: 'id_ID');
    }
    return formatter.format(amount);
  }
}