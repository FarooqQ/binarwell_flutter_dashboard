import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import 'dashboard_content_grid.dart';
import 'dashboard_header.dart';

class DashboardMainArea extends StatelessWidget {
  const DashboardMainArea({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 760;
        final rightPadding = isCompact ? AppSpacing.md : AppSpacing.xl;
        final headerGap = isCompact ? AppSpacing.md : AppSpacing.lg;

        return Container(
          color: AppColors.background,
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            rightPadding,
            AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DashboardHeader(),
              SizedBox(height: headerGap),
              const Expanded(child: DashboardContentGrid()),
            ],
          ),
        );
      },
    );
  }
}
