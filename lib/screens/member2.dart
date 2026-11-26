import 'package:flutter/material.dart';

class Member2Screen extends StatelessWidget {
  const Member2Screen({super.key});

  static const displayName = 'Member 2';
  static const accentColor = Color(0xFF74509F);
  static const _photoAsset = '';
  static const _details = [
    (icon: Icons.location_on_outlined, label: 'Address', value: 'To be added'),
    (icon: Icons.email_outlined, label: 'Email', value: 'To be added'),
    (
      icon: Icons.school_outlined,
      label: 'Academic qualifications',
      value: 'To be added',
    ),
    (icon: Icons.groups_outlined, label: 'Soft skills', value: 'To be added'),
    (
      icon: Icons.stars_outlined,
      label: 'Special talents',
      value: 'To be added',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const photoSize = 96.0;
    final placeholder = ColoredBox(
      color: accentColor.withValues(alpha: 0.15),
      child: const Icon(
        Icons.person_outline,
        color: accentColor,
        size: photoSize / 2,
      ),
    );
    final photo = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox.square(
        dimension: photoSize,
        child: _photoAsset.isEmpty
            ? placeholder
            : Image.asset(
                _photoAsset,
                fit: BoxFit.cover,
                excludeFromSemantics: true,
                errorBuilder: (_, _, _) => placeholder,
              ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(displayName)),
      body: ListView(
        children: [
          ColoredBox(
            color: accentColor.withValues(alpha: 0.12),
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Row(
                children: [
                  photo,
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      displayName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          for (final detail in _details)
            ExpansionTile(
              leading: Icon(detail.icon, color: accentColor),
              title: Text(detail.label),
              children: [ListTile(title: Text(detail.value))],
            ),
        ],
      ),
    );
  }
}
