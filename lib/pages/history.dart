import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sakusaya/db.dart';

class SksyHistory extends StatefulWidget {
  const SksyHistory({super.key});

  @override
  State<SksyHistory> createState() => _SksyHistoryState();
}

class _SksyHistoryState extends State<SksyHistory> {
  DateTime datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('History'),
      ),
      body: ValueListenableBuilder(
        valueListenable: SksyDatabase.boxHistory!.listenable(),
        builder: (context, box, widget) {
          String date = '${datetime.year}/${datetime.month}/${datetime.day}';
          List historyEntries = box.get(date, defaultValue: []);
          return ListView.builder(
            itemCount: historyEntries.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(historyEntries[index]['category']),
                    subtitle: Text(historyEntries[index]['time'].toString()),
                    trailing: Text(historyEntries[index]['amount'].toString()),
                  ),
                  const Divider(height: 0)
                ],
              );
            }, 
          );
        }
      ),
    );
  }

  String getDate() {
    return '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}';
  }
}