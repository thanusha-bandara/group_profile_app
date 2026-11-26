import 'package:flutter/material.dart';

class Member6Screen extends StatelessWidget {
  const Member6Screen({super.key});

  static const displayName = 'Asrar';
  static const accentColor = Color(0xFF395285);
  static const _photoAsset = 'lib/assets_img/IMG_1164.JPG.jpeg';
  static const _details = [
    (icon: Icons.location_on_outlined, label: 'Address', value: 'Sri Lanka'),
    (icon: Icons.email_outlined, label: 'Email', value: 'Add your email'),
    (
      icon: Icons.school_outlined,
      label: 'Academic qualifications',
      value: 'IT / Computer Science studies, Software Development, Web and Mobile Application Development',
    ),
    (
      icon: Icons.groups_outlined,
      label: 'Soft skills',
      value: 'Teamwork, Problem Solving, Communication, Time Management, Adaptability',
    ),
    (
      icon: Icons.stars_outlined,
      label: 'Special talents',
      value: 'Programming, Web Development, Flutter Mobile App Development, Database Management, UI Development',
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