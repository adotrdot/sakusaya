import 'package:flutter/material.dart';
import 'package:sakusaya/ui/app_bar.dart';
import 'package:sakusaya/pages/chart.dart';
import 'package:sakusaya/ui/fab.dart';
import 'package:go_router/go_router.dart';
import 'package:sakusaya/pages/history.dart';
import 'package:sakusaya/pages/home.dart';
import 'package:sakusaya/routing/routes.dart';
import 'package:sakusaya/pages/settings.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter goRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: SksyRoutes.routes[0]!,
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) {
        return SksyNavigator(page: child);
      },
      routes: [
        GoRoute(
          path: SksyRoutes.routes[0]!,
          builder: (context, state) {
            return const SksyHome();
          },
        ),
        GoRoute(
          path: SksyRoutes.routes[1]!,
          builder: (context, state) {
            return const SksyHistory();
          },
        ),
        GoRoute(
          path: SksyRoutes.routes[2]!,
          builder: (context, state) {
            return const SksyChart();
          },
        ),
        GoRoute(
          path: SksyRoutes.routes[3]!,
          builder: (context, state) {
            return const SksySettings();
          }
        ),
      ],
    ),
  ],
);

class SksyNavigator extends StatefulWidget {
  const SksyNavigator({super.key, required this.page});

  final Widget page;

  @override
  State<SksyNavigator> createState() => _SksyNavigatorState();
}

class _SksyNavigatorState extends State<SksyNavigator> {
  int curTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<TabChanged>(
      child: Scaffold(
        body: widget.page,
        bottomNavigationBar: SksyAppBar(curTabIndex: curTabIndex),
        floatingActionButton: const SksyFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      onNotification: (n) {
        setState(() {
          curTabIndex = n.id;
          context.go(SksyRoutes.routes[curTabIndex]!);
        });
        return true;
      },
    );
  }
}