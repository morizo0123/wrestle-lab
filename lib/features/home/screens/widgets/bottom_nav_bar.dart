import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/routes/route_path_name.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static const tabs = [
    RoutePathName.home,
    RoutePathName.events,
    RoutePathName.organizations,
    RoutePathName.youtube,
    RoutePathName.myHistory,
    RoutePathName.news,
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = tabs.indexWhere((path) => location == path || location.startsWith('$path/'));
    final index = currentIndex < 0 ? 0 : currentIndex;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      currentIndex: index,
      onTap: (i) {
        if (i == index) return;
        context.go(tabs[i]);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          activeIcon: Icon(Icons.calendar_today),
          label: 'イベント',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups_outlined),
          activeIcon: Icon(Icons.groups),
          label: '団体',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outlined),
          activeIcon: Icon(Icons.play_circle),
          label: 'YouTube',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_outlined),
          activeIcon: Icon(Icons.history),
          label: 'My履歴',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_outlined),
          activeIcon: Icon(Icons.newspaper),
          label: 'ニュース',
        ),
      ],
    );
  }
}
