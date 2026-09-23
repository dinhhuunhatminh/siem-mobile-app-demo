import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Khung Scaffold có BottomNavigationBar dùng chung cho 4 tab chính:
/// Home, Alerts, Dashboards, Reports.
///
/// go_router (StatefulShellRoute) truyền [navigationShell] vào đây — nó
/// tự quản lý việc giữ state riêng của từng tab khi chuyển qua lại,
/// widget này chỉ lo phần vẽ thanh điều hướng và bắt sự kiện bấm tab.
class AppBottomNavbarScaffold extends StatelessWidget {
  const AppBottomNavbarScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications), label: 'Alerts'),
          NavigationDestination(icon: Icon(Icons.show_chart_outlined), selectedIcon: Icon(Icons.show_chart), label: 'Dashboards'),
          NavigationDestination(icon: Icon(Icons.description_outlined), selectedIcon: Icon(Icons.description), label: 'Reports'),
        ],
      ),
    );
  }
}
