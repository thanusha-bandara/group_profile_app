# Group Profile App

This Flutter app uses Firebase email/password authentication and displays nine group member profiles after sign-in.

## Run on Android

1. Register the Android application ID `com.group_profile_app` in the group's Firebase project and save its `google-services.json` to `android/app/`.
2. Run `flutter pub get`, then use `flutter run` with an Android device or emulator.
3. Sign in with the test account created in Firebase Authentication. Use the sign-out button on the member list to return to the login screen.

## Group members

| Name | Student ID | Bio screen |
| --- | --- | --- |
| To be added | To be added | [Member 1](lib/screens/member1.dart) |
| To be added | To be added | [Member 2](lib/screens/member2.dart) |
| To be added | To be added | [Member 3](lib/screens/member3.dart) |
| To be added | To be added | [Member 4](lib/screens/member4.dart) |
| To be added | To be added | [Member 5](lib/screens/member5.dart) |
| To be added | To be added | [Member 6](lib/screens/member6.dart) |
| To be added | To be added | [Member 7](lib/screens/member7.dart) |
| To be added | To be added | [Member 8](lib/screens/member8.dart) |
| To be added | To be added | [Member 9](lib/screens/member9.dart) |

Each member can add their name, address, email, academic qualifications, soft skills, talents and photo to their own screen file. Keep photos in the app's `assets` folder, declare them in `pubspec.yaml` and set `_photoAsset` to the corresponding asset path.

## Lecturer test login

Add the dedicated Firebase test account details to the handoff for the lecturer.
