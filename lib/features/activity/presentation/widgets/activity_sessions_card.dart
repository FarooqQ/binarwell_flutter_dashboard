import 'package:flutter/material.dart';

import '../../data/activity_mock_data.dart';
import '../../models/activity_session_model.dart';

class ActivitySessionsCard extends StatelessWidget {
  const ActivitySessionsCard({super.key});

  static const Color _primaryColor = Color(0xFF0BAE9A);
  static const Color _textColor = Color(0xFF0F172A);
  static const Color _mutedTextColor = Color(0xFF64748B);
  static const Color _borderColor = Color(0xFFE2E8F0);
  static const Color _softBackground = Color(0xFFE4F8F5);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SessionsHeader(),
          SizedBox(height: 16),
          _SessionsTimeline(),
        ],
      ),
    );
  }
}

class _SessionsHeader extends StatelessWidget {
  const _SessionsHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Activity Sessions",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: ActivitySessionsCard._textColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Your movement breakdown',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: ActivitySessionsCard._mutedTextColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SessionsTimeline extends StatelessWidget {
  const _SessionsTimeline();

  @override
  Widget build(BuildContext context) {
    final sessions = ActivityMockData.sessions;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TimelineRail(itemCount: sessions.length),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            children: [
              for (var index = 0; index < sessions.length; index++) ...[
                _SessionTile(session: sessions[index]),
                if (index != sessions.length - 1) const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _TimelineRail extends StatelessWidget {
  const _TimelineRail({required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 150,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 9,
            bottom: 9,
            child: Container(
              width: 2,
              decoration: BoxDecoration(
                color: const Color(0xFFCBD5E1),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          for (var index = 0; index < itemCount; index++)
            Positioned(
              top: index * 58.0,
              child: Container(
                width: 11,
                height: 11,
                decoration: BoxDecoration(
                  color: const Color(0xFF64748B),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.session});

  final ActivitySessionModel session;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final useCompactLayout = constraints.maxWidth < 360;

        return Container(
          constraints: const BoxConstraints(minHeight: 48),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: useCompactLayout
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const _SessionIcon(),
                        const SizedBox(width: 12),
                        Expanded(child: _SessionInfo(session: session)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _SessionMetrics(
                      session: session,
                      alignment: WrapAlignment.start,
                    ),
                  ],
                )
              : Row(
                  children: [
                    const _SessionIcon(),
                    const SizedBox(width: 12),
                    Expanded(flex: 5, child: _SessionInfo(session: session)),
                    const SizedBox(width: 12),
                    Flexible(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: _SessionMetrics(
                          session: session,
                          alignment: WrapAlignment.end,
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _SessionIcon extends StatelessWidget {
  const _SessionIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: ActivitySessionsCard._softBackground,
        borderRadius: BorderRadius.circular(13),
      ),
      child: const Icon(
        Icons.directions_walk_rounded,
        color: ActivitySessionsCard._primaryColor,
        size: 19,
      ),
    );
  }
}

class _SessionInfo extends StatelessWidget {
  const _SessionInfo({required this.session});

  final ActivitySessionModel session;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          session.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: ActivitySessionsCard._textColor,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${session.time} • ${session.intensity}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: ActivitySessionsCard._mutedTextColor,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _SessionMetrics extends StatelessWidget {
  const _SessionMetrics({required this.session, required this.alignment});

  final ActivitySessionModel session;
  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      spacing: 8,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _MetricText(value: session.primaryMetric),
        const _MetricDot(),
        _MetricText(value: session.secondaryMetric),
        if (session.calories.isNotEmpty) ...[
          const _MetricDot(),
          _MetricText(value: session.calories),
        ],
      ],
    );
  }
}

class _MetricText extends StatelessWidget {
  const _MetricText({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: ActivitySessionsCard._textColor,
        fontSize: 12,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _MetricDot extends StatelessWidget {
  const _MetricDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: 3,
      decoration: BoxDecoration(
        color: const Color(0xFFCBD5E1),
        borderRadius: BorderRadius.circular(99),
      ),
    );
  }
}
