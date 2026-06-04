import 'package:flutter/material.dart';

class WellnessGoalsHeader extends StatelessWidget {
  const WellnessGoalsHeader({super.key});

  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _softBorder = Color(0xFFE2ECE8);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 720;

        final titleArea = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wellness Goals',
              key: const Key('wellness-goals-title'),
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w900,
                color: _darkText,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Track your goals, build healthy habits, and review progress.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _mutedText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );

        final actions = Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            OutlinedButton.icon(
              key: const Key('wellness-goals-today-filter-button'),
              onPressed: () {},
              icon: const Icon(Icons.calendar_today_rounded, size: 18),
              label: const Text('Today'),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF34423D),
                side: const BorderSide(color: _softBorder),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            ElevatedButton.icon(
              key: const Key('wellness-goals-add-goal-button'),
              onPressed: () {},
              icon: const Icon(Icons.add_rounded, size: 20),
              label: const Text('Add Goal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _primaryGreen,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                textStyle: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            _HeaderIconButton(
              icon: Icons.notifications_none_rounded,
              tooltip: 'Notifications',
              onPressed: () {},
            ),
            _HeaderIconButton(
              icon: Icons.person_outline_rounded,
              tooltip: 'Profile',
              onPressed: () {},
            ),
          ],
        );

        if (isCompact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [titleArea, const SizedBox(height: 18), actions],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: titleArea),
            const SizedBox(width: 24),
            actions,
          ],
        );
      },
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  static const Color _iconColor = Color(0xFF34423D);
  static const Color _softBorder = Color(0xFFE2ECE8);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: _iconColor,
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: _softBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          fixedSize: const Size(46, 46),
        ),
      ),
    );
  }
}
