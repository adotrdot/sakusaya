import 'package:flutter/material.dart';
import 'package:sakusaya/app_bar.dart';
import 'package:sakusaya/fab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Home';
  int curTabIndex = 2;

  Text getTitle() {
    String newTitle = '';
    switch(curTabIndex) {
      case 0:
        newTitle = 'Home';
      case 1:
        newTitle = 'History';
      case 2:
        newTitle = 'Chart';
      case 3:
        newTitle = 'Settings';
    }
    return Text(newTitle);
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<TabChanged>(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: getTitle(),
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Hello world'),
            ],
          ),
        ),
        bottomNavigationBar: SksyAppBar(curTabIndex: curTabIndex),
        floatingActionButton: const SksyFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      onNotification: (n) {
        setState(() {
          curTabIndex = n.id;
        });
        return true;
      },
    );
  }
}