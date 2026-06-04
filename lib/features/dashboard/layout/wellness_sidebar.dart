import 'package:flutter/material.dart';

import '../navigation/carepulse_page.dart';

const Color _appCanvasBackground = Color(0xFFF6FAF9);

class WellnessSidebar extends StatefulWidget {
  const WellnessSidebar({
    super.key,
    this.selectedPage = CarePulsePage.overview,
    this.onPageSelected,
  });

  final CarePulsePage selectedPage;
  final ValueChanged<CarePulsePage>? onPageSelected;

  @override
  State<WellnessSidebar> createState() => _WellnessSidebarState();
}

class _WellnessSidebarState extends State<WellnessSidebar> {
  late CarePulsePage _localSelectedPage;

  static const List<_SidebarItemData> _items = [
    _SidebarItemData(
      page: CarePulsePage.overview,
      icon: Icons.grid_view_rounded,
      label: 'Overview',
    ),
    _SidebarItemData(
      page: CarePulsePage.activity,
      icon: Icons.directions_walk_rounded,
      label: 'Activity',
    ),
    _SidebarItemData(
      page: CarePulsePage.wellnessGoals,
      icon: Icons.flag_rounded,
      label: 'Wellness Goals',
    ),
    _SidebarItemData(
      page: CarePulsePage.checkups,
      icon: Icons.fact_check_rounded,
      label: 'Checkups',
    ),
    _SidebarItemData(
      page: CarePulsePage.nutrition,
      icon: Icons.restaurant_rounded,
      label: 'Nutrition',
    ),
    _SidebarItemData(
      page: CarePulsePage.reports,
      icon: Icons.analytics_rounded,
      label: 'Reports',
    ),
    _SidebarItemData(
      page: CarePulsePage.settings,
      icon: Icons.settings_rounded,
      label: 'Settings',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _localSelectedPage = widget.selectedPage;
  }

  @override
  void didUpdateWidget(covariant WellnessSidebar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedPage != widget.selectedPage) {
      _localSelectedPage = widget.selectedPage;
    }
  }

  void _selectPage(CarePulsePage page) {
    setState(() {
      _localSelectedPage = page;
    });

    widget.onPageSelected?.call(page);
  }

  @override
  Widget build(BuildContext context) {
    final activePage = widget.onPageSelected == null
        ? _localSelectedPage
        : widget.selectedPage;

    return Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _appCanvasBackground,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F0F172A),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const _SidebarHeader(),
          const SizedBox(height: 36),
          Expanded(
            child: ListView.separated(
              itemCount: _items.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = _items[index];

                return _SidebarItem(
                  icon: item.icon,
                  label: item.label,
                  isSelected: activePage == item.page,
                  onTap: () => _selectPage(item.page),
                );
              },
            ),
          ),
          const _UserCard(),
        ],
      ),
    );
  }
}

class _SidebarHeader extends StatelessWidget {
  const _SidebarHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF12BFA5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.favorite_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CarePulse',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Wellness Dashboard',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? const Color(0xFFE4F8F5)
        : Colors.transparent;

    final borderColor = isSelected
        ? const Color(0xFFB7EDE6)
        : Colors.transparent;

    final foregroundColor = isSelected
        ? const Color(0xFF0BAE9A)
        : const Color(0xFF64748B);

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Icon(icon, color: foregroundColor, size: 21),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: foregroundColor,
                    fontSize: 15,
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4FAFB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFDCEEF1)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB),
              borderRadius: BorderRadius.circular(21),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: 23,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Guest User',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xFF0F172A),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Wellness Member',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 12,
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

class _SidebarItemData {
  const _SidebarItemData({
    required this.page,
    required this.icon,
    required this.label,
  });

  final CarePulsePage page;
  final IconData icon;
  final String label;
}
