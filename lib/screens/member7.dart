import 'package:flutter/material.dart';

class Member7Screen extends StatelessWidget {
  const Member7Screen({super.key});

  static const displayName = 'Mohamed asriff ';
  static const accentColor = Color(0xFF4D652D);
  static const _photoAsset = 'lib/assets/jm.jpg';
  static const _details = [
    (icon: Icons.location_on_outlined, label: 'Address', value: 'diyagama,colombo'),
    (icon: Icons.email_outlined, label: 'Email', value: 'mohamedasriff2003@gmail.com'),
    (
      icon: Icons.school_outlined,
      label: 'Academic qualifications',
      value: 'diploma in IT',
    ),
    (icon: Icons.groups_outlined, label: 'Soft skills', value: 'team work'),
    (
      icon: Icons.stars_outlined,
      label: 'Special talents',
      value: 'sports',
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
      borderRadius: BorderRadius.circular(8),
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
      body: SelectionArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Align(alignment: Alignment.centerLeft, child: photo),
            const SizedBox(height: 24),
            for (final detail in _details) ...[
              Text(
                detail.label,
                style: Theme.of(context).textTheme.labelLarge
                    ?.copyWith(color: accentColor),
              ),
              const SizedBox(height: 4),
              Text(
                detail.value,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const Divider(),
            ],
          ],
        ),
      ),
    );
  }
}
