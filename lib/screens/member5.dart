import 'package:flutter/material.dart';

class Member5Screen extends StatelessWidget {
  const Member5Screen({super.key});

  static const displayName = 'Nimeth shavinda';
  static const accentColor = Color(0xFF7D375A);
  static const _photoAsset = 'lib/assets/shavinda.jpg';
  static const _details = [
    (
      icon: Icons.location_on_outlined,
      label: 'Address',
      value: 'colombo Sri lanka',
    ),
    (
      icon: Icons.email_outlined,
      label: 'Email',
      value: 'nimethshavinda1@gmail.com',
    ),
    (
      icon: Icons.school_outlined,
      label: 'Academic qualifications',
      value: 'institute of technology university of moratuwa',
    ),
    (
      icon: Icons.groups_outlined,
      label: 'Soft skills',
      value: 'teamwork, communication, problem-solving',
    ),
    (
      icon: Icons.stars_outlined,
      label: 'Special talents',
      value: 'Badminton, cricket, music, photography',
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
      borderRadius: BorderRadius.circular(32),
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
          Center(child: photo),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final detail in _details)
                ActionChip(
                  avatar: Icon(detail.icon, color: accentColor),
                  label: Text(detail.label),
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (context) => SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: ListTile(
                          leading: Icon(detail.icon, color: accentColor),
                          title: Text(detail.label),
                          subtitle: Text(detail.value),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
