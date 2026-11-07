import 'package:flutter/material.dart';

class SidebarNavItem extends StatelessWidget {
  const SidebarNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.badgeCount,
    this.isSelected = false,
    this.onTap,
    this.isContentExpanded = true,
  });

  final IconData icon;
  final String label;
  final int? badgeCount;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isContentExpanded;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderRadius = BorderRadius.circular(8);

    final backgroundColor = isSelected
        ? colorScheme.secondaryContainer
        : Colors.transparent;
    final hoverColor = isDark
        ? colorScheme.secondaryContainer.withValues(alpha: 0.45)
        : colorScheme.secondaryContainer.withValues(alpha: 0.65);

    final contentColor = isSelected
        ? colorScheme.onSecondaryContainer
        : colorScheme.onSurface.withValues(alpha: isDark ? 0.7 : 0.85);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          hoverColor: isSelected ? Colors.transparent : hoverColor,
          highlightColor: colorScheme.secondaryContainer.withValues(
            alpha: 0.35,
          ),
          splashColor: colorScheme.primary.withValues(alpha: 0.12),
          borderRadius: borderRadius,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Icon(icon, size: 18, color: contentColor),
                if (isContentExpanded) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: contentColor,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                  if (badgeCount != null && badgeCount! > 0)
                    _Badge(count: badgeCount!),
                ],
              ],
            ),
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
