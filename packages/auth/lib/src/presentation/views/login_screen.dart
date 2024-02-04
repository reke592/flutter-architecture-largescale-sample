import 'package:auth/auth.dart';
import 'package:auth/src/domain/entities/user.dart';
import 'package:commons/commons.dart';
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
                context.read<AuthProvider>().user = const User(
                  id: '1',
                  username: 'test',
                );
                context.goNamed(kHomeRouteName);
              },
              child: const Text('Sign-in'),
            ),
          ],
        ),
      ),
    );
  }
}
