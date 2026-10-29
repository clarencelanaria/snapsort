import 'package:flutter/material.dart';

import '../data/sample_features.dart';
import 'feature_card.dart';

/// The first tab of the app: header, welcome message and feature cards.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.auto_awesome_mosaic, color: accent),
            const SizedBox(width: 10),
            const Text(
              'SnapSort',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      // Lets the screen scroll on small phones or with large text sizes.
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Welcome section ---
            Text('Welcome to SnapSort', style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              'Organize your screenshots and give your photos a quick polish.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // --- Feature cards ---
            GridView.builder(
              // The grid sits inside a scroll view, so it must not scroll
              // itself and must only take the height it needs.
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sampleFeatures.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                return FeatureCard(item: sampleFeatures[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
