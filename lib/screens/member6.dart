import 'package:flutter/material.dart';

class Member6Screen extends StatelessWidget {
  const Member6Screen({super.key});

  static const displayName = 'Member 6';
  static const accentColor = Color(0xFF395285);
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
    const photoSize = 120.0;
    final placeholder = ColoredBox(
      color: accentColor.withValues(alpha: 0.15),
      child: const Icon(
        Icons.person_outline,
        color: accentColor,
        size: photoSize / 2,
      ),
    );
    final photo = ClipRRect(
      borderRadius: BorderRadius.circular(60),
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [accentColor, accentColor.withValues(alpha: 0.65)],
                ),
              ),
              child: Center(child: photo),
            ),
          ),
          SliverList.list(
            children: ListTile.divideTiles(
              context: context,
              tiles: _details.map(
                (detail) => ListTile(
                  leading: Icon(detail.icon, color: accentColor),
                  title: Text(detail.label),
                  subtitle: Text(detail.value),
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}
