import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SksyFAB extends StatefulWidget {
  const SksyFAB({super.key});

  @override
  State<SksyFAB> createState() => _SksyFABState();
}

class _SksyFABState extends State<SksyFAB> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
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
    );
  }
}