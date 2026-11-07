import 'package:flutter/material.dart';
import 'package:koto/core/utils/responsive.dart';
import 'package:koto/features/shell/presentation/widgets/appbar_shell.dart';
import 'package:koto/features/shell/presentation/widgets/sidebar.dart';

class ShellPage extends StatelessWidget {
  const ShellPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isCompactDesktop = Responsive.isCompactDesktop(context);

    if (isMobile) {
      return Scaffold(
        appBar: const AppBarShell(showMenuButton: true),
        drawer: Drawer(child: SideBar()),
        body: child,
      );
    }

    if (isCompactDesktop) {
      return Scaffold(
        appBar: const AppBarShell(),
        body: Row(
          children: [
            SideBar(),
            const VerticalDivider(),
            Expanded(child: child),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: const AppBarShell(),
      body: Row(
        children: [
          SideBar(),
          const VerticalDivider(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
