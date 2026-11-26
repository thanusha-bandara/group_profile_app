import 'package:flutter/material.dart';

class Member2Screen extends StatelessWidget {
  const Member2Screen({super.key});

  static const displayName = 'Nisal Aluthge';
  static const accentColor = Color(0xFF74509F);
  static const _photoAsset = 'lib/assets/nisal.png';

  static const _details = [
    (
      icon: Icons.location_on_outlined,
      label: 'Address',
      value: '290,Beruketiya,Kiriwaththuduwa',
    ),
    (
      icon: Icons.email_outlined,
      label: 'Email',
      value: 'nisalpaluthge@gmail.com',
    ),
    (
      icon: Icons.school_outlined,
      label: 'Academic Qualifications',
      value:
          'Information Technology - Institute of Technology, University of Moratuwa (2024-2027)\n'
          'AI/ML Engineer Stage 1 - SLIIT\n'
          'G.C.E. Advanced Level - Physical Science Stream\n'
          'G.C.E. Ordinary Level - Taxila Central College',
    ),
    (
      icon: Icons.groups_outlined,
      label: 'Soft Skills',
      value:
          'Leadership\n'
          'Teamwork\n'
          'Communication\n'
          'Problem Solving\n'
          'Time Management\n'
          'Discipline\n'
          'Adaptability',
    ),
    (
      icon: Icons.stars_outlined,
      label: 'Special Talents',
      value:
          'University Cricketer - University of Moratuwa\n'
          'Participated in Inter-University Cricket Tournaments\n'
          'Participated in Division 3 Cricket\n'
          'Cricket Coordinator - ITUM Sport Club\n'
          'Part-time O/L Mathematics Teacher\n'
          'Deputy Head Prefect - Taxila Central College\n'
          'President - Senior Science Society, Taxila Central College\n'
          'Interested in IoT and Embedded Systems',
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
