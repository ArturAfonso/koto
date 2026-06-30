import 'package:flutter/material.dart';
import 'package:koto/core/di/injection.dart';
import 'package:koto/core/shared/widgets/vertical_divider_widget.dart';
import 'package:koto/core/theme/theme_cubit.dart';
import 'package:koto/core/theme/themetoggle_button.dart';
import 'package:koto/features/inbox/presentation/widgets/inbox_sidebar.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<ThemeCubit>();
    final isDark = cubit.state == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Theme.of(context).colorScheme.shadow,
        title: Row(
          children: [
            //Icon(Icons.mail_outline),
            Image.asset(
              isDark ? 'assets/images/dark-icon-resized-cut.png' : 'assets/images/light-Icon-resized-cut.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 8),
            const Text('Koto Mail'),
            Spacer(),
          ],
        ),
        actions: [ThemetoggleButton()],
      ),
      body: Row(
        children: [
          InboxSidebar(),
          CustomVerticalDivider(),
          Expanded(child: Center(child: Text('Inbox - Em construção'))),
        ],
      ),
    );
  }
}
