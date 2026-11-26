import 'package:flutter/material.dart';

class Member4Screen extends StatelessWidget {
  const Member4Screen({super.key});

  static const displayName = 'Hashini';
  static const accentColor = Color(0xFF9F492F);
  static const _photoAsset = 'lib/assets/hashini.png';
  static const _details = [
    (icon: Icons.location_on_outlined, label: 'Address', value: 'Tissamaharama , Sri Lanka'),
    (icon: Icons.email_outlined, label: 'Email', value: 'hashinianu23@gmail.com'),
    (
      icon: Icons.school_outlined,
      label: 'Academic qualifications',
      value: 'NDT in IT - Institute of Technology, University of Moratuwa',
    ),
    (icon: Icons.groups_outlined, label: 'Soft skills', value: 'Teamwork, Communication, Time Management'),
    (
      icon: Icons.stars_outlined,
      label: 'Special talents',
      value: 'Photography',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const photoSize = 124.0;
    final placeholder = ColoredBox(
      color: accentColor.withValues(alpha: 0.15),
      child: const Icon(
        Icons.person_outline,
        color: accentColor,
        size: photoSize / 2,
      ),
    );
    final photo = ClipRRect(
      borderRadius: BorderRadius.circular(12),
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
        padding: const EdgeInsets.all(20),
        children: [
          Align(alignment: Alignment.centerRight, child: photo),
          const SizedBox(height: 16),
          for (final detail in _details)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsetsDirectional.only(start: 12),
              decoration: BoxDecoration(
                border: BorderDirectional(
                  start: BorderSide(color: accentColor, width: 4),
                ),
              ),
              child: ListTile(
                leading: Icon(detail.icon, color: accentColor),
                title: Text(detail.label),
                subtitle: Text(detail.value),
              ),
            ),
        ],
      ),
    );
  }
}