import 'package:flutter/material.dart';
import 'package:koto/core/di/injection.dart';
import 'package:koto/core/theme/app_colors.dart';
import 'package:koto/core/theme/theme_cubit.dart';


class AddNewAccountButton extends StatefulWidget {
  const AddNewAccountButton({super.key});

  @override
  State<AddNewAccountButton> createState() => _AddNewAccountButtonState();
}

class _AddNewAccountButtonState extends State<AddNewAccountButton> {
  bool _hovered = false;
  

  @override
  Widget build(BuildContext context) {
    final cubit = sl<ThemeCubit>();
      final isDark = cubit.state == ThemeMode.dark;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
         
            decoration: BoxDecoration(
            
            color:  _hovered  ? (isDark? AppColors.darkInput: AppColors.lightInput) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
              ), 
          duration: const Duration(milliseconds: 50),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
         
          child: Row(
            children: [
              Icon(
                Icons.person_add_alt_1_outlined,
                 color: isDark? AppColors.lightMutedForeground : AppColors.lightForeground,
                 
                size: 18,
              ),
              const SizedBox(width: 15, ),
              Text(
                'Adicionar Conta',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isDark? AppColors.lightMutedForeground : AppColors.lightForeground,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}