import 'package:flutter/material.dart';

import '../features/dashboard/page/carepulse_dashboard_page.dart';
import 'theme/app_theme.dart';

class CarePulseApp extends StatelessWidget {
  const CarePulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarePulse Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const CarePulseDashboardPage(),
    );
  }
}
