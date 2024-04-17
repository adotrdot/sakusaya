import 'package:flutter/material.dart';
import 'package:sakusaya/db.dart';
import 'package:sakusaya/ui/dialog_builder.dart';

class SksyExpenseDialog {
  static build(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SksyDialogBuilder(
          title: 'Expenses',
          context: context,
          dropdownItems: const [
            {'value': 'foodDrink', 'label': 'Food & Drink'},
            {'value': 'transport', 'label': 'Transportation'},
            {'value': 'rent', 'label': 'Rent'},
            {'value': 'entertain', 'label': 'Entertainment'},
            {'value': 'others', 'label': 'Others'},
          ],
          box: SksyDatabase.boxExpenses!
        );
      },
    );
  }
}