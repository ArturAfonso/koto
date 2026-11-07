import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koto/core/shared/widgets/vertical_divider_widget.dart';
import 'package:koto/core/theme/theme_cubit.dart';
import 'package:koto/core/theme/themetoggle_button.dart';
import 'package:koto/features/shell/presentation/widgets/sidebar.dart';

class InboxLineLayout extends StatelessWidget {
  const InboxLineLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return Scaffold(
          body: Row(
            children: [Expanded(child: Center(child: Text('Inbox - Em construção')))],
          ),
        );
      },
    );
  }
}
