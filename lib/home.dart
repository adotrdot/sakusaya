import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Hello World',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.home), tooltip: 'Home',)),
            Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.history), tooltip: 'Record')),
            Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.bar_chart), tooltip: 'Chart')),
            Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.settings), tooltip: 'Settings',)),
          ],
        )
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5.0),
        spaceBetweenChildren: 4.0,
        renderOverlay: false,
        tooltip: 'Insert Data',
        children: [
          SpeedDialChild(
            child: const Icon(Icons.arrow_downward),
            label: 'Income',
            onTap: () {},
          ),
          SpeedDialChild(
            child: const Icon(Icons.arrow_upward),
            label: 'Expense',
            onTap: () {},
          ),
        ],
      )
    );
  }
}