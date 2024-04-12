import 'package:flutter/material.dart';
import 'package:sakusaya/icon_btn.dart';

class SksyAppBar extends StatefulWidget {
  const SksyAppBar({super.key});

  @override
  State<SksyAppBar> createState() => _SksyAppBarState();
}

class _SksyAppBarState extends State<SksyAppBar> {
  var btns = [
    BarButton(const Icon(Icons.home), 'Home', true),
    BarButton(const Icon(Icons.history), 'History', false),
    BarButton(const Icon(Icons.bar_chart), 'Chart', false),
    BarButton(const Icon(Icons.settings), 'Settings', false),
  ];

  generateButtons() {
    var barBtns = <Widget>[];
    for (var i = 0; i < btns.length; i++) {
      var newBtn = NotificationListener<ButtonPressed>(
        child: Expanded(
          child: SksyIconButton(
            id: i,
            icon: btns[i].icon,
            tooltip: btns[i].tooltip,
            isActive: btns[i].isActive,
          ),
        ),
        onNotification: (n) {
          setState(() {
            for (var i = 0; i < btns.length; i++) {
              if (i == n.id) {
                btns[i].on();
              } else {
                btns[i].off();
              }
            }
          });
          TabChanged(n.id).dispatch(context);
          return true;
        },
      );
      barBtns.add(newBtn);
    }
    return barBtns;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        children: generateButtons(),
      ),
    );
  }
}

class BarButton {
  final Widget icon;
  final String tooltip;
  bool isActive;

  BarButton(this.icon, this.tooltip, this.isActive);

  on() {
    isActive = true;
  }

  off() {
    isActive = false;
  }
}

class TabChanged extends Notification {
  final int id;
  TabChanged(this.id);
}