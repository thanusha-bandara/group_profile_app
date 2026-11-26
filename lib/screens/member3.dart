import 'package:flutter/material.dart';

class Member3Screen extends StatelessWidget {
  const Member3Screen({super.key});

  static const displayName = 'Member 3';
  static const accentColor = Color(0xFF216F68);
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
      borderRadius: BorderRadius.circular(48),
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
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(16), child: photo),
            const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Contact'),
                Tab(text: 'Education'),
                Tab(text: 'Skills'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  for (final group in [
                    _details.take(2),
                    _details.skip(2).take(1),
                    _details.skip(3),
                  ])
                    ListView(
                      children: [
                        for (final detail in group)
                          ListTile(
                            leading: Icon(detail.icon, color: accentColor),
                            title: Text(detail.label),
                            subtitle: Text(detail.value),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
