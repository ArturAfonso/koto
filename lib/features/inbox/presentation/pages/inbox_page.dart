import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koto/core/di/injection.dart';
import 'package:koto/core/shared/bloc/layout_preference_cubit.dart';
import 'package:koto/core/shared/widgets/vertical_divider_widget.dart';
import 'package:koto/core/theme/theme_cubit.dart';
import 'package:koto/core/theme/themetoggle_button.dart';
import 'package:koto/core/utils/responsive.dart';
import 'package:koto/features/inbox/presentation/pages/mobile/inbox_page_mobile.dart';
import 'package:koto/features/inbox/presentation/pages/desktop/inbox_page_linestyle.dart';
import 'package:koto/features/inbox/presentation/pages/desktop/inbox_page_columnstyle.dart';
import 'package:koto/features/shell/presentation/widgets/sidebar.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.builder(
      context: context,
      mobile: const InboxMobileLayout(),
      // compactDesktop: const InboxCompactDesktopLayout(),
      wideDesktop: BlocBuilder<LayoutPreferenceCubit, DesktopLayoutType>(
        builder: (context, layoutType) => switch (layoutType) {
          DesktopLayoutType.line => const InboxLineLayout(),
          DesktopLayoutType.column => const InboxColumnLayout(),
        },
      ),
    );
  }
}
