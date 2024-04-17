import 'package:hive_flutter/hive_flutter.dart';

class SksyDatabase {
  // Initializer
  static Box? boxPocket;
  static Box? boxIncome;
  static Box? boxExpenses;
  static Future<bool>? boxOpened;

  Future<bool> initDB() async {
    await Hive.initFlutter();
    boxIncome = await Hive.openBox('income');
    boxExpenses = await Hive.openBox('expenses');
    boxPocket = await Hive.openBox('pocket');

    // Debug only
    boxIncome!.clear();
    boxExpenses!.clear();
    boxPocket!.clear();

    return true;
  }
}