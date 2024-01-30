import 'package:auth/auth.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem<void>(
                onTap: () {
                  context.pushReplacementNamed(kLoginRouteName);
                },
                child: const Row(
                  children: [
                    Text('Logout'),
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text('Dashboard Screen'),
      ),
    );
  }
}
