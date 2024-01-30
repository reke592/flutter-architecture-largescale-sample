import 'package:commons/commons.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Standard Login Page',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () {
                context.pushReplacementNamed(kDashboardRouteName);
              },
              child: const Text('Sign-in'),
            ),
          ],
        ),
      ),
    );
  }
}
