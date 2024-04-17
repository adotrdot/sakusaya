import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sakusaya/db.dart';

class SksyDialogBuilder extends StatefulWidget {
  const SksyDialogBuilder({
    super.key,
    required this.title,
    required this.context,
    required this.dropdownItems,
    required this.box,
  });

  final String title;
  final BuildContext context;
  final List<Map<String, String>> dropdownItems;
  final Box box;

  @override
  State<SksyDialogBuilder> createState() => _SksyDialogBuilderState();
}

class _SksyDialogBuilderState extends State<SksyDialogBuilder> {
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return dialogBuilder(
      title: widget.title,
      context: widget.context,
      dropdownItems: widget.dropdownItems,
      box: widget.box,
    );
  }

  dialogBuilder({
    required String title,
    required BuildContext context,
    required List<Map<String, String>> dropdownItems,
    required Box box,
  }) {

    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: amountController,
              decoration: const InputDecoration(
                label: Text('Amount'),
                border: OutlineInputBorder(),
                hintText: 'Enter amount',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: DropdownMenu(
              initialSelection: dropdownItems.first['value'],
              controller: categoryController,
              requestFocusOnTap: false,
              dropdownMenuEntries: dropdownItems.map((e) {
                return DropdownMenuEntry(
                  value: e['value'],
                  label: e['label']!,
                );
              }).toList(),
              onSelected: (selected) {
                setState(() {
                  selectedCategory = selected;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: detailController,
              decoration: const InputDecoration(
                label: Text('Detail'),
                border: OutlineInputBorder(),
                hintText: 'Enter detail',
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Get amount
            int amount = 0;
            amount = int.parse(amountController.text);

            // Insert into database
            selectedCategory = (selectedCategory == null) ? dropdownItems.first['value'] : selectedCategory;
            box.put(selectedCategory, amount);
            
            // Change total money
            if (box.name == 'expenses') amount *= -1;
            SksyDatabase.boxPocket!.put('totalMoney', SksyDatabase.boxPocket!.get('totalMoney', defaultValue: 0)+amount);

            // Add to history
            DateTime datetime = DateTime.now();
            String date = '${datetime.year}-${datetime.month}-${datetime.day}';
            List history = box.get('history/$date', defaultValue: []);
            Map<String, dynamic> newHistory = {
              'amount': amount.abs(),
              'category': categoryController.text,
              'detail': detailController.text,
              'time': '${datetime.hour}:${datetime.minute}',
            };
            history.add(newHistory);
            box.put('history/$date', history);

            // Destroy dialog window
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}