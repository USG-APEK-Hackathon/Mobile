import 'package:apex_mobile/src/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main app widget
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Apex Mobile MVP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'TTHoves',
        scaffoldBackgroundColor: const Color(0xFF022964),
        useMaterial3: true,
      ),
      routerConfig: ref.watch(appRouter).config(), /// The router configuration
    );
  }
}
