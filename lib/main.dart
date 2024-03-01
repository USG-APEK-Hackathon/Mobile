import 'package:apex_mobile/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // Ensures that the Flutter binding is initialized before the app starts
  WidgetsFlutterBinding.ensureInitialized();

  // Run the app
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
