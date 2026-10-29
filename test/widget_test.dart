import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:snapsort/app/app.dart';
import 'package:snapsort/core/widgets/placeholder_screen.dart';
import 'package:snapsort/features/home/presentation/feature_card.dart';

/// Starts the app on a phone-sized screen (360 x 800 logical pixels).
///
/// The default test screen is wider and shorter than a phone, so we set
/// the size ourselves to test what a real user would see.
Future<void> pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1080, 2400);
  tester.view.devicePixelRatio = 3.0;
  // Restore the default size when the test ends.
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(const SnapSortApp());
}

/// Taps a bottom navigation tab by its label.
///
/// "Gallery" and "Screenshots" also appear on the home screen cards, so we
/// search only inside the NavigationBar to tap the right widget.
Future<void> tapTab(WidgetTester tester, String label) async {
  await tester.tap(
    find.descendant(of: find.byType(NavigationBar), matching: find.text(label)),
  );
  // Waits for the tab-switch animation to finish.
  await tester.pumpAndSettle();
}

void main() {
  group('Home screen', () {
    testWidgets('shows the header and welcome section', (tester) async {
      await pumpApp(tester);

      expect(find.text('SnapSort'), findsOneWidget);
      expect(find.text('Welcome to SnapSort'), findsOneWidget);
    });

    testWidgets('shows the four feature cards', (tester) async {
      await pumpApp(tester);

      expect(find.byType(FeatureCard), findsNWidgets(4));

      for (final title in [
        'Gallery',
        'Screenshots',
        'Favorites',
        'Photo Editor',
      ]) {
        expect(
          find.descendant(
            of: find.byType(FeatureCard),
            matching: find.text(title),
          ),
          findsOneWidget,
        );
      }
    });
  });

  group('Bottom navigation', () {
    testWidgets('shows four destinations and starts on Home', (tester) async {
      await pumpApp(tester);

      expect(find.byType(NavigationDestination), findsNWidgets(4));
      // The home screen is visible; no placeholder screen is showing.
      expect(find.text('Welcome to SnapSort'), findsOneWidget);
      expect(find.byType(PlaceholderScreen), findsNothing);
    });

    testWidgets('opens the Gallery placeholder', (tester) async {
      await pumpApp(tester);

      await tapTab(tester, 'Gallery');

      expect(find.byType(PlaceholderScreen), findsOneWidget);
      expect(
        find.text('Your photos will appear here in a future milestone.'),
        findsOneWidget,
      );
      expect(find.text('Welcome to SnapSort'), findsNothing);
    });

    testWidgets('opens the Screenshots placeholder', (tester) async {
      await pumpApp(tester);

      await tapTab(tester, 'Screenshots');

      expect(find.byType(PlaceholderScreen), findsOneWidget);
      expect(
        find.text(
          'Your screenshots will be sorted here in a future milestone.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('opens the Settings placeholder', (tester) async {
      await pumpApp(tester);

      await tapTab(tester, 'Settings');

      expect(find.byType(PlaceholderScreen), findsOneWidget);
      expect(
        find.text('App preferences will live here in a future milestone.'),
        findsOneWidget,
      );
    });

    testWidgets('returns to Home from another tab', (tester) async {
      await pumpApp(tester);

      await tapTab(tester, 'Settings');
      await tapTab(tester, 'Home');

      expect(find.text('Welcome to SnapSort'), findsOneWidget);
      expect(find.byType(PlaceholderScreen), findsNothing);
    });
  });
}
