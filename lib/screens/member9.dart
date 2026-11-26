import 'package:flutter/material.dart';

class Member9Screen extends StatelessWidget {
  const Member9Screen({super.key});

  static const displayName = 'Anjana Bandara';
  static const accentColor = Color(0xFF9A3F45);
  static const _photoAsset = 'lib/assets/anjana.jpg';
  static const _details = [
    (icon: Icons.location_on_outlined, label: 'Address', value: 'Yodhagama,Hemmathagama'),
    (icon: Icons.email_outlined, label: 'Email', value: 'anjanashasimal@gmail.com'),
    (
      icon: Icons.school_outlined,
      label: 'Academic qualifications',
      value: 'Imformation Technology',
    ),
    (icon: Icons.groups_outlined, label: 'Soft skills', value: 'Team Work'),
    (
      icon: Icons.stars_outlined,
      label: 'Special talents',
      value: 'Graphic Design',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const photoSize = 116.0;
    final placeholder = ColoredBox(
      color: accentColor.withValues(alpha: 0.15),
      child: const Icon(
        Icons.person_outline,
        color: accentColor,
        size: photoSize / 2,
      ),
    );
    final photo = ClipRRect(
      borderRadius: BorderRadius.circular(58),
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
        padding: const EdgeInsets.all(24),
        children: [
          Center(child: photo),
          const SizedBox(height: 20),
          for (final detail in _details)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: accentColor.withValues(alpha: 0.13),
                    foregroundColor: accentColor,
                    child: Icon(detail.icon),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detail.label,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(detail.value),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
