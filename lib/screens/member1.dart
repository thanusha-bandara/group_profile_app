import 'package:flutter/material.dart';

class Member1Screen extends StatelessWidget {
  const Member1Screen({super.key});

  static const displayName = 'Thanusha Samudrajith';
  static const accentColor = Color(0xFF255B91);
  static const _photoAsset = 'lib/assets/thanusha.jpg';
  static const _softSkills = [
    'Problem-solving',
    'Teamwork',
    'Communication',
    'Adaptability',
  ];

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).textTheme;
    final initials = displayName
        .split(' ')
        .where((word) => word.isNotEmpty)
        .take(2)
        .map((word) => word.characters.first.toUpperCase())
        .join();

    final placeholder = ColoredBox(
      color: const Color(0xFFD8EDFC),
      child: Center(
        child: Text(
          initials,
          style: typography.headlineMedium?.copyWith(
            color: const Color(0xFF142B49),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5FA),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFFF1F5FA),
        foregroundColor: const Color(0xFF142B49),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF142B49), Color(0xFF255B91)],
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: SizedBox.square(
                            dimension: 92,
                            child: _photoAsset.isEmpty
                                ? placeholder
                                : Image.asset(
                                    _photoAsset,
                                    fit: BoxFit.cover,
                                    excludeFromSemantics: true,
                                    errorBuilder: (_, _, _) => placeholder,
                                  ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Semantics(
                          header: true,
                          child: Text(
                            displayName,
                            style: typography.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              height: 1.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const _ProfileSection(
                  title: 'Contact',
                  icon: Icons.contact_mail_outlined,
                  children: [
                    _ProfileEntry(
                      title: 'Address',
                      subtitle: 'polonnaruwa Road,Rajaela, Minneriya',
                    ),
                    SizedBox(height: 12),
                    _ProfileEntry(
                      title: 'Email',
                      subtitle: 'thanushasb@gmail.com',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _ProfileSection(
                  title: 'Academic Qualifications',
                  icon: Icons.school_outlined,
                  children: [
                    const _ProfileEntry(
                      title: 'National Diploma in Technology in Information Technology',
                      subtitle:
                          'Institute of Technology, University of Moratuwa',
                      bullet: true,
                    ),
                    const SizedBox(height: 14),
                    const _ProfileEntry(
                      title: 'G.C.E. Advanced Level (Physical Science)',
                      bullet: true,
                    ),
                    const Divider(height: 32, color: Color(0xFFDEE7F1)),
                    Semantics(
                      header: true,
                      child: const Text(
                        'Certifications',
                        style: TextStyle(
                          color: Member1Screen.accentColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const _ProfileEntry(
                      title: 'Python for Beginners',
                      subtitle: 'University of Moratuwa',
                      bullet: true,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _ProfileSection(
                  title: 'Soft Skills',
                  icon: Icons.groups_outlined,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final skill in _softSkills)
                          Chip(
                            label: Text(skill),
                            backgroundColor: const Color(0xFFE9F2FC),
                            side: BorderSide.none,
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const _ProfileSection(
                  title: 'Special Talents',
                  icon: Icons.stars_outlined,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(
                          avatar: Icon(Icons.music_note_outlined, size: 18),
                          label: Text('Music'),
                        ),
                        Chip(
                          avatar: Icon(Icons.code_rounded, size: 18),
                          label: Text('Programming'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({
    required this.title,
    required this.icon,
    required this.children,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFDEE7F1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color(0xFFE9F2FC),
                  foregroundColor: Member1Screen.accentColor,
                  child: Icon(icon, size: 19),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Semantics(
                    header: true,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF142B49),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _ProfileEntry extends StatelessWidget {
  const _ProfileEntry({
    required this.title,
    this.subtitle,
    this.bullet = false,
  });

  final String title;
  final String? subtitle;
  final bool bullet;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (bullet) ...[
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: Icon(
              Icons.circle,
              size: 6,
              color: Member1Screen.accentColor,
            ),
          ),
          const SizedBox(width: 10),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              if (subtitle case final description?) ...[
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(color: Color(0xFF495C73)),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
