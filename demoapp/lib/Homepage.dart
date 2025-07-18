import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  HomePage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text(
          'Welcome, $email!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
