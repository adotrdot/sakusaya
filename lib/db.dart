import 'package:hive_flutter/hive_flutter.dart';

class SksyDatabase {
  // Initializer
  static Box? boxPocket;
  static Box? boxIncome;
  static Box? boxExpenses;
  static Box? boxHistory;
  static Future<bool>? boxOpened;

  Future<bool> initDB() async {
    await Hive.initFlutter();
    boxIncome = await Hive.openBox('income');
    boxExpenses = await Hive.openBox('expenses');
    boxPocket = await Hive.openBox('pocket');
    boxHistory = await Hive.openBox('history');

    // Debug only
    boxIncome!.clear();
    boxExpenses!.clear();
    boxPocket!.clear();
    boxHistory!.clear();

    return true;
  }
}