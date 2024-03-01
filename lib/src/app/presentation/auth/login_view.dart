import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

/// The view for the login page
@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: Text('Login'),
      ),
    );
  }
}