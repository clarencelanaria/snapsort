import 'package:flutter/material.dart';

import '../data/sample_features.dart';

/// A tappable card that shows one [FeatureItem]: an icon, a title
/// and a short description.
class FeatureCard extends StatelessWidget {
  const FeatureCard({super.key, required this.item, this.onTap});

  final FeatureItem item;

  /// Called when the card is tapped. Optional (`?` means it can be null).
  /// In this milestone the home screen leaves it empty.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = Theme.of(context).colorScheme.primary;

    return Card(
      // Clips the tap ripple to the card's rounded corners.
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: accent),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
