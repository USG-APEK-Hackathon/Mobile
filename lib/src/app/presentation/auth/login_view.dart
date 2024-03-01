import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

/// The view for the login page
@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    // final HealthFactory health = HealthFactory();
    // bool isAuthorized = await health.requestAuthorization(
    //   [
    //     HealthDataType.STEPS,
    //   ],
    // );

    // if (isAuthorized) {
    //   print('Authorized');
    // } else {
    //   print('Not authorized');
    // }
  }
  // Request permissions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: Text('Login'),
      ),
    );
  }
}
