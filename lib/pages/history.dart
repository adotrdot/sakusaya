import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:sakusaya/db.dart';
import 'package:sakusaya/pages/settings.dart';

class SksyHistory extends StatefulWidget {
  const SksyHistory({super.key});

  @override
  State<SksyHistory> createState() => _SksyHistoryState();
}

class _SksyHistoryState extends State<SksyHistory> {
  DateTime datetime = DateTime.now();
  final List<String> _typeFilters = ['All', 'Income', 'Expenses'];
  Set<String> typeFilters = {'All'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('History'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {showCalendarModal();},
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                const Text('Filters: '),
                Wrap(
                  spacing: 4.0,
                  children: 
                    _typeFilters.map((filter) {
                      return FilterChip(
                        label: Text(filter),
                        selected: typeFilters.contains(filter),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              typeFilters.clear();
                              typeFilters.add(filter);
                            }
                          });
                        }
                      );
                    }).toList()
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: SksyDatabase.boxHistory!.listenable(),
              builder: (context, box, widget) {
                String date = '${datetime.year}/${datetime.month}/${datetime.day}';
                List historyEntries = List.from(box.get(date, defaultValue: []));

                // Filter list
                if (typeFilters.contains('Income')) {
                  historyEntries.removeWhere(
                    (entry) => entry['type'] == 'expenses'
                  );
                } else if (typeFilters.contains('Expenses')) {
                  historyEntries.removeWhere(
                    (entry) => entry['type'] == 'income'
                  );
                }
                
                return ListView.builder(
                  itemCount: historyEntries.length,
                  itemBuilder: (context, index) {
                    String type = historyEntries[index]['type'];
                    String amount = '${type == "income" ? "+" : "-"}${getCurrency(historyEntries[index]['amount'])}';
                    DateTime entryDatetime = historyEntries[index]['time'];
                    String entryDate = '${entryDatetime.year}/${entryDatetime.month}/${entryDatetime.day}';
                    String entryTime = '${entryDatetime.hour}:${entryDatetime.minute}';
                    return Column(
                      children: [
                        ListTile(
                          title: Text(historyEntries[index]['category']),
                          subtitle: Text('$entryDate • $entryTime'),
                          trailing: Text(amount),
                        ),
                        ExpansionTile(
                          title: const Text('Detail'),
                          children: [
                            ListTile(
                              title: Text(historyEntries[index]['detail']),
                            ),
                          ],
                        ),
                        const Divider(height: 0)
                      ],
                    );
                  }, 
                );
              }
            ),
          ),
        ],
      )
    );
  }

  // Date formatting doesn't work yet, need to import locale?
  // String getDate(DateTime datetime) {
  //   try {
  //     formatter = initializeDateFormatting(Platform.localeName).then((value) => {
  //       DateFormat.yMMMMd(Platform.localeName).format(datetime)
  //     });
  //   } catch (e) {
  //     initializeDateFormatting('id_ID').then((value) => {
  //       DateFormat.yMMMMd('id_ID').format(datetime)
  //     });
  //   }
  // }

  // String getTime(DateTime datetime) {
  //   DateFormat formatter;
  //   try {
  //     formatter = DateFormat.jm(Platform.localeName);
  //   } catch (e) {
  //     formatter = DateFormat.jm('id_ID');
  //   }
  //   return formatter.format(datetime);
  // }

  String getCurrency(int amount) {
    NumberFormat formatter;
    try {
      formatter = NumberFormat.currency(locale: Platform.localeName);
    } catch(e) {
      formatter = NumberFormat.currency(locale: 'id_ID');
    }
    return formatter.format(amount);
  }

  void showCalendarModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Calendar'),
                ElevatedButton(
                  onPressed: () {Navigator.pop(context);},
                  child: const Text('close'),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}