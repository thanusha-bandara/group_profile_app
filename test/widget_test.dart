import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:group_profile_app/screens/home.dart';
import 'package:group_profile_app/screens/login.dart';
import 'package:group_profile_app/screens/member1.dart';

void main() {
  testWidgets('Login screen validates empty fields', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    expect(find.text('Email address'), findsOneWidget);
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pump();

    expect(find.text('Enter your email address.'), findsOneWidget);
    expect(find.text('Enter your password.'), findsOneWidget);
  });

  testWidgets('Home opens each member profile', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    for (var number = 1; number <= 9; number++) {
      final title = number == 1 ? Member1Screen.displayName : 'Member $number';
      await tester.scrollUntilVisible(find.text(title), 150);
      await tester.tap(find.text(title));
      await tester.pumpAndSettle();

      if (number == 1) {
        expect(find.byType(Member1Screen), findsOneWidget);
        expect(find.text('Contact'), findsOneWidget);
      } else {
        expect(find.widgetWithText(AppBar, title), findsOneWidget);
      }
      await tester.pageBack();
      await tester.pumpAndSettle();
    }
  });
}
