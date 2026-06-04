import 'package:flutter/material.dart';

import '../../data/activity_mock_data.dart';

class TodayMovementCard extends StatelessWidget {
  const TodayMovementCard({super.key});

  static const Color _primaryColor = Color(0xFF0BAE9A);
  static const Color _textColor = Color(0xFF0F172A);
  static const Color _mutedTextColor = Color(0xFF64748B);
  static const Color _borderColor = Color(0xFFE2E8F0);
  static const Color _softBackground = Color(0xFFE4F8F5);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final useCompactLayout = constraints.maxWidth < 420;

        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: _borderColor),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A0F172A),
                blurRadius: 24,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: useCompactLayout
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _MovementTitle(),
                    SizedBox(height: 18),
                    _MovementStatusMessage(),
                    SizedBox(height: 24),
                    _ProgressSummary(),
                    SizedBox(height: 24),
                    _MovementStatsGrid(),
                  ],
                )
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _MovementTitle(),
                    SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 3, child: _ProgressSummary()),
                        SizedBox(width: 28),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _MovementStatusMessage(),
                              SizedBox(height: 20),
                              _MovementStatsGrid(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _MovementTitle extends StatelessWidget {
  const _MovementTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Today's Movement",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: TodayMovementCard._textColor,
        fontSize: 22,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _MovementStatusMessage extends StatelessWidget {
  const _MovementStatusMessage();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: TodayMovementCard._softBackground,
            borderRadius: BorderRadius.circular(17),
          ),
          child: const Icon(
            Icons.check_rounded,
            color: TodayMovementCard._primaryColor,
            size: 21,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            ActivityMockData.statusMessage,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: TodayMovementCard._textColor,
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProgressSummary extends StatelessWidget {
  const _ProgressSummary();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 168,
          height: 168,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 168,
                height: 168,
                child: CircularProgressIndicator(
                  value: ActivityMockData.progress,
                  strokeWidth: 13,
                  backgroundColor: TodayMovementCard._softBackground,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    TodayMovementCard._primaryColor,
                  ),
                  strokeCap: StrokeCap.round,
                ),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '6,420',
                    style: TextStyle(
                      color: TodayMovementCard._textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '/ 8,000 steps',
                    style: TextStyle(
                      color: TodayMovementCard._mutedTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    ActivityMockData.progressLabel,
                    style: TextStyle(
                      color: TodayMovementCard._primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MovementStatsGrid extends StatelessWidget {
  const _MovementStatsGrid();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final tileWidth = constraints.maxWidth >= 360
            ? (constraints.maxWidth - 12) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _MovementStatTile(
              width: tileWidth,
              icon: Icons.location_on_rounded,
              label: 'Distance',
              value: ActivityMockData.distance,
            ),
            _MovementStatTile(
              width: tileWidth,
              icon: Icons.timer_rounded,
              label: 'Active Time',
              value: ActivityMockData.activeTime,
            ),
            _MovementStatTile(
              width: tileWidth,
              icon: Icons.local_fire_department_rounded,
              label: 'Calories',
              value: ActivityMockData.calories,
            ),
            _MovementStatTile(
              width: tileWidth,
              icon: Icons.directions_walk_rounded,
              label: 'Remaining',
              value: '1,580 steps',
            ),
          ],
        );
      },
    );
  }
}

class _MovementStatTile extends StatelessWidget {
  const _MovementStatTile({
    required this.width,
    required this.icon,
    required this.label,
    required this.value,
  });

  final double width;
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: TodayMovementCard._softBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: TodayMovementCard._primaryColor, size: 19),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: TodayMovementCard._textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: TodayMovementCard._mutedTextColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


