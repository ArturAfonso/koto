import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key, this.isContentExpanded = true});

  final bool isContentExpanded;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderRadius = BorderRadius.circular(8);
    final contentColor = colorScheme.onSurface.withValues(
      alpha: isDark ? 0.7 : 0.85,
    );
    final hoverColor = isDark
        ? colorScheme.secondaryContainer.withValues(alpha: 0.45)
        : colorScheme.secondaryContainer.withValues(alpha: 0.65);

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        hoverColor: hoverColor,
        highlightColor: colorScheme.secondaryContainer.withValues(alpha: 0.35),
        splashColor: colorScheme.primary.withValues(alpha: 0.12),
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(Icons.settings_outlined, color: contentColor, size: 18),
              if (isContentExpanded) ...[
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Configurações',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: contentColor),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
