import 'package:flutter/material.dart';
import 'package:a02_cinemapedia/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:a02_cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().getTheme(),
      title: 'Material App',
      routerConfig: appRouter,
    );
  }
}
