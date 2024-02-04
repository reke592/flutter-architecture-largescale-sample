import 'package:flutter/widgets.dart';

class UserNotificationsScreen extends StatefulWidget {
  const UserNotificationsScreen({super.key});

  @override
  State<UserNotificationsScreen> createState() =>
      _UserNotificationsScreenState();
}

class _UserNotificationsScreenState extends State<UserNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('User Notifications Screen'),
    );
  }
}
