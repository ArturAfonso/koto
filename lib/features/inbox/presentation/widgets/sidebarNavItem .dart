import 'package:flutter/material.dart';

class SidebarNavItem extends StatefulWidget {
  const SidebarNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.badgeCount,
    this.isSelected = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final int? badgeCount;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  State<SidebarNavItem> createState() => _SidebarNavItemState();
}

class _SidebarNavItemState extends State<SidebarNavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Cores baseadas no estado
    final Color bgColor;
    if (widget.isSelected) {
      bgColor = colorScheme.secondaryContainer;
    } else if (_hovered) {
      bgColor = colorScheme.secondaryContainer.withOpacity(0.5);
    } else {
      bgColor = Colors.transparent;
    }

    final Color contentColor = widget.isSelected
        ? colorScheme.onSecondaryContainer
        : _hovered
            ? colorScheme.onSecondaryContainer.withOpacity(0.8)
            : colorScheme.onSurface.withOpacity(isDark ? 0.7 : 0.85);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(widget.icon, size: 18, color: contentColor),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: contentColor,
                        fontWeight: widget.isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                ),
              ),
              if (widget.badgeCount != null && widget.badgeCount! > 0)
                _Badge(count: widget.badgeCount!),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count > 99 ? '99+' : '$count',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}