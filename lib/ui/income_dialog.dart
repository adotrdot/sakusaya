import 'package:flutter/material.dart';
import 'package:sakusaya/db.dart';
import 'package:sakusaya/ui/dialog_builder.dart';

class SksyIncomeDialog {
  static build(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SksyDialogBuilder(
          title: 'Income',
          context: context,
          dropdownItems: const [
            {'value': 'parents', 'label': 'Parents'},
            {'value': 'tutor', 'label': 'Tutor'},
            {'value': 'projects', 'label': 'Projects'},
            {'value': 'others', 'label': 'Others'},
          ],
          box: SksyDatabase.boxIncome!
        );
      }
    );
  }
}