import 'package:flutter/material.dart';

import '../../data/wellness_goals_mock_data.dart';
import 'goal_category_progress_item.dart';

class GoalCategoriesCard extends StatelessWidget {
  const GoalCategoriesCard({super.key});

  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    final categories = WellnessGoalsMockData.categories;

    return Container(
      constraints: const BoxConstraints(minHeight: 230),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _softBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CategoriesHeader(),
          const SizedBox(height: 12),
          for (var index = 0; index < categories.length; index++) ...[
            GoalCategoryProgressItem(category: categories[index]),
            if (index != categories.length - 1) const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _CategoriesHeader extends StatelessWidget {
  const _CategoriesHeader();

  static const Color _darkText = GoalCategoriesCard._darkText;
  static const Color _mutedText = GoalCategoriesCard._mutedText;
  static const Color _primaryGreen = GoalCategoriesCard._primaryGreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _HeaderIcon(),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Goal Categories',
                key: const Key('goal-categories-title'),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _darkText,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Track progress by wellness area.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _mutedText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: _primaryGreen,
            visualDensity: VisualDensity.compact,
          ),
          child: const Text('Details'),
        ),
      ],
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F3),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Icon(
        Icons.category_outlined,
        size: 20,
        color: Color(0xFF13A889),
      ),
    );
  }
}

