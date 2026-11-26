import 'package:flutter/material.dart';

class Member8Screen extends StatelessWidget {
  const Member8Screen({super.key});

  static const displayName = 'Nimantha Bandara';
  static const accentColor = Color(0xFF855C26);
  static const _photoAsset = 'lib/assets/Nimantha.jpeg';
  static const _details = [
    (icon: Icons.location_on_outlined, label: 'Address', value: 'No. 67, Rathmetiya Rd, Rikillagaskada'),
    (icon: Icons.email_outlined, label: 'Email', value: 'Nimanthabandara990@gmail.com'),
    (
      icon: Icons.school_outlined,
      label: 'Academic qualifications',
      value: 'NDT in Information Technology - ITUM (2025 - Present)\nHND in Digital Technologies (Cloud Networking) - Nebula Institute of Technology (2023 - 2025)',
    ),
    (icon: Icons.groups_outlined, label: 'Soft skills', value: 'Problem Solving, Analytical Thinking, Adaptability'),
    (
      icon: Icons.stars_outlined,
      label: 'Special talents',
      value: 'Cloud & DevOps, Backend Development, Programming, Flutter, IoT and Networking',
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
      borderRadius: BorderRadius.circular(24),
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
        padding: const EdgeInsets.all(16),
        children: [
          Center(child: photo),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) => Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final detail in _details)
                  SizedBox(
                    width: constraints.maxWidth >= 500
                        ? (constraints.maxWidth - 12) / 2
                        : constraints.maxWidth,
                    child: Card.outlined(
                      child: ListTile(
                        leading: Icon(detail.icon, color: accentColor),
                        title: Text(detail.label),
                        subtitle: Text(detail.value),
                      ),
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
