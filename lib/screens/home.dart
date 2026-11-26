import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'member1.dart';
import 'member2.dart';
import 'member3.dart';
import 'member4.dart';
import 'member5.dart';
import 'member6.dart';
import 'member7.dart';
import 'member8.dart';
import 'member9.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not sign out. Try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final members = [
      (Member1Screen.displayName, Member1Screen.accentColor, Member1Screen.new),
      (Member2Screen.displayName, Member2Screen.accentColor, Member2Screen.new),
      (Member3Screen.displayName, Member3Screen.accentColor, Member3Screen.new),
      (Member4Screen.displayName, Member4Screen.accentColor, Member4Screen.new),
      (Member5Screen.displayName, Member5Screen.accentColor, Member5Screen.new),
      (Member6Screen.displayName, Member6Screen.accentColor, Member6Screen.new),
      (Member7Screen.displayName, Member7Screen.accentColor, Member7Screen.new),
      (Member8Screen.displayName, Member8Screen.accentColor, Member8Screen.new),
      (Member9Screen.displayName, Member9Screen.accentColor, Member9Screen.new),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Group members'),
        actions: [
          IconButton(
            tooltip: 'Sign out',
            onPressed: () => _signOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: members.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final (name, color, createScreen) = members[index];
            return Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: color.withValues(alpha: 0.15),
                  foregroundColor: color,
                  child: const Icon(Icons.person_outline),
                ),
                title: Text(name),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute<void>(builder: (_) => createScreen())),
              ),
            );
          },
        ),
      ),
    );
  }
}
