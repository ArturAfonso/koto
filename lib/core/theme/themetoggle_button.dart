import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koto/core/di/injection.dart';
import 'package:koto/core/theme/theme_cubit.dart';

class ThemetoggleButton extends StatelessWidget {
  const ThemetoggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        final isDark = state == ThemeMode.dark;
        return IconButton(
          onPressed: () {
            context.read<ThemeCubit>().setTheme(isDark ? ThemeMode.light : ThemeMode.dark);
          },
          icon: Icon(!isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
        );
      },
    );
  }
}
