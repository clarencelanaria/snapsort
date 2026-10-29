import 'package:flutter/material.dart';

/// Describes one feature of the app, such as "Gallery".
///
/// This is just a bundle of related values. It has no behavior.
class FeatureItem {
  const FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

/// Sample data for the four cards on the home screen.
///
/// Nothing here comes from the device. It is hard-coded on purpose
/// for Milestone 1.
const List<FeatureItem> sampleFeatures = [
  FeatureItem(
    title: 'Gallery',
    description: 'Browse all your photos',
    icon: Icons.photo_library_outlined,
  ),
  FeatureItem(
    title: 'Screenshots',
    description: 'Find and sort screenshots',
    icon: Icons.screenshot_outlined,
  ),
  FeatureItem(
    title: 'Favorites',
    description: 'Photos you love',
    icon: Icons.favorite_border,
  ),
  FeatureItem(
    title: 'Photo Editor',
    description: 'Crop, rotate and adjust',
    icon: Icons.tune,
  ),
];
