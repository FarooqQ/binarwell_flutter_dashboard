import 'package:flutter/material.dart';

import '../features/dashboard/page/binarwell_dashboard_page.dart';
import 'theme/app_theme.dart';

class BinarWellApp extends StatelessWidget {
  const BinarWellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BinarWell Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const BinarWellDashboardPage(),
    );
  }
}


