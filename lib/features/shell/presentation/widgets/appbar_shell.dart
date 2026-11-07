import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koto/core/theme/theme_cubit.dart';
import 'package:koto/core/theme/themetoggle_button.dart';

class AppBarShell extends StatelessWidget implements PreferredSizeWidget {
  const AppBarShell({super.key, this.showMenuButton = false, this.onMenuPressed});

  final bool showMenuButton;
  final VoidCallback? onMenuPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return AppBar(
          leading: showMenuButton
              ? Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: onMenuPressed ?? () => Scaffold.of(context).openDrawer(),
                  ),
                )
              : null,
          elevation: 2,
          shadowColor: Theme.of(context).colorScheme.shadow,
          title: showMenuButton
              ? null
              : Row(
                  children: [
                    //Icon(Icons.mail_outline),
                    Image.asset(
                      state == ThemeMode.dark
                          ? 'assets/images/dark-icon-resized-cut.png'
                          : 'assets/images/light-Icon-resized-cut.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 8),
                    const Text('Koto Mail'),
                    const Spacer(),
                  ],
                ),
          actions: [if (!showMenuButton) ThemetoggleButton()],
        );
      },
    );
  }
}
