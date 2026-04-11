import 'package:go_router/go_router.dart';
import 'package:koto/features/inbox/presentation/pages/inbox_page.dart';
import 'package:koto/features/auth/presentation/pages/account_setup_page.dart';
import 'package:koto/features/email/presentation/pages/email_detail_page.dart';
import 'package:koto/features/compose/presentation/pages/compose_page.dart';
import 'package:koto/features/settings/presentation/pages/settings_page.dart';

abstract class AppRoutes {
  static const String inbox = '/';
  static const String accountSetup = '/account-setup';
  static const String emailDetail = '/email/:id';
  static const String compose = '/compose';
  static const String settings = '/settings';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.inbox,
  routes: [
    GoRoute(
      path: AppRoutes.inbox,
      name: 'inbox',
      builder: (context, state) => const InboxPage(),
    ),
    GoRoute(
      path: AppRoutes.accountSetup,
      name: 'account-setup',
      builder: (context, state) => const AccountSetupPage(),
    ),
    GoRoute(
      path: AppRoutes.emailDetail,
      name: 'email-detail',
      builder: (context, state) {
        final emailId = state.pathParameters['id']!;
        return EmailDetailPage(emailId: emailId);
      },
    ),
    GoRoute(
      path: AppRoutes.compose,
      name: 'compose',
      builder: (context, state) => const ComposePage(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      name: 'settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
); 