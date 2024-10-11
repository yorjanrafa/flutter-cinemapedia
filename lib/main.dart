import 'package:flutter/material.dart';
import 'package:a02_cinemapedia/config/router/app_router.dart';

import 'package:a02_cinemapedia/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

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
