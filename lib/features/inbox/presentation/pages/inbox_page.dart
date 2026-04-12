import 'package:flutter/material.dart';
import 'package:koto/core/shared/widgets/vertical_divider_widget.dart';
import 'package:koto/core/theme/themetoggle_button.dart';
import 'package:koto/features/inbox/presentation/widgets/inbox_sidebar.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Theme.of(context).colorScheme.shadow,
        title: Row(
          children: [
            Icon(Icons.mail_outline),
            const SizedBox(width: 8),
            const Text('Koto Mail'),
            Spacer()
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


