import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../layout/dashboard_shell.dart';

class BinarWellDashboardPage extends StatelessWidget {
  const BinarWellDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: DashboardShell()),
    );
  }
}

