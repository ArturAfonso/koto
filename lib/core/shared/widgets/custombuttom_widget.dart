import 'package:flutter/material.dart';
import 'package:koto/core/theme/app_colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.label, this.icon, this.onTap});

  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          height: 44,

          decoration: _hovered
              ? BoxDecoration(
                  // Hover: cor de fundo com alpha + borda primária
                  color: AppColors.lightRing,
                  borderRadius: BorderRadius.circular(8),
                 // border: Border.all(color: Colors.red),
                  //boxShadow: SkyShadows.glowSoft,
                )
              : BoxDecoration(
                  // Normal: fundo secundário e borda padrão
                  color:AppColors.darkRing,
                  borderRadius: BorderRadius.circular(8),
                  //border: Border.all(color: Theme.of(context).dividerColor),
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, color: AppColors.lightBackground, size: 16),
                const SizedBox(width: 5),
              ],
              Text(
                widget.label,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.lightBackground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
