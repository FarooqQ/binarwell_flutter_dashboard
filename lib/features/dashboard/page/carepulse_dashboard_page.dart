import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../layout/dashboard_shell.dart';

class CarePulseDashboardPage extends StatelessWidget {
  const CarePulseDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: DashboardShell()),
    );
  }
}
