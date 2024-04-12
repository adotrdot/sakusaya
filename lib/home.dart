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

  @override
  Widget build(BuildContext context) {
    return NotificationListener<TabChanged>(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
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
        bottomNavigationBar: const SksyAppBar(),
        floatingActionButton: const SksyFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      onNotification: (n) {
        setState(() {
          switch(n.id) {
            case 0:
              title = 'Home';
            case 1:
              title = 'History';
            case 2:
              title = 'Chart';
            case 3:
              title = 'Settings';
            default:
              title = '';
          }
        });
        return true;
      },
    );
  }
}