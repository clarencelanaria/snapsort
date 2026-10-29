import 'package:flutter/material.dart';

import 'app_shell.dart';
import 'theme.dart';

/// The root widget of SnapSort. It sets the app title and theme, and
/// chooses the first screen.
class SnapSortApp extends StatelessWidget {
  const SnapSortApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnapSort',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const AppShell(),
    );
  }
}
