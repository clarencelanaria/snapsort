import 'package:flutter/material.dart';

import '../core/widgets/placeholder_screen.dart';
import '../features/home/presentation/home_screen.dart';

/// The frame around the whole app: the current screen plus the
/// bottom navigation bar.
///
/// It is a StatefulWidget because it must remember which tab is selected,
/// and redraw when that changes.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  // Index of the selected tab: 0 = Home, 1 = Gallery, 2 = Screenshots,
  // 3 = Settings. The order matches the destinations list below.
  int _currentIndex = 0;

  // One screen per tab, in the same order as the destinations.
  static const List<Widget> _screens = [
    HomeScreen(),
    PlaceholderScreen(
      icon: Icons.photo_library_outlined,
      title: 'Gallery',
      description: 'Your photos will appear here in a future milestone.',
    ),
    PlaceholderScreen(
      icon: Icons.screenshot_outlined,
      title: 'Screenshots',
      description:
          'Your screenshots will be sorted here in a future milestone.',
    ),
    PlaceholderScreen(
      icon: Icons.settings_outlined,
      title: 'Settings',
      description: 'App preferences will live here in a future milestone.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show only the screen for the selected tab.
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          // setState tells Flutter "something changed, rebuild me".
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_library_outlined),
            selectedIcon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          NavigationDestination(
            icon: Icon(Icons.screenshot_outlined),
            selectedIcon: Icon(Icons.screenshot),
            label: 'Screenshots',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
