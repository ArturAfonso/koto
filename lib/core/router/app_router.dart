import 'package:go_router/go_router.dart';
import 'package:koto/features/auth/presentation/pages/login_page.dart';
import 'package:koto/features/inbox/presentation/pages/inbox_page.dart';
import 'package:koto/features/auth/presentation/pages/account_setup_page.dart';
import 'package:koto/features/email/presentation/pages/email_detail_page.dart';
import 'package:koto/features/compose/presentation/pages/compose_page.dart';
import 'package:koto/features/settings/presentation/pages/settings_page.dart';
import 'package:koto/features/shell/presentation/pages/shell_page.dart';

abstract class Routes {
  static const String root = '/';
  static const String login = '/login';

  //sidebar buttons
  static const String accountSetup = '/account-setup';
  static const String settings = '/settings';

  //folders
  static const String inbox = '/inbox';
  static const String sent = '/sent';
  static const String drafts = '/drafts';
  static const String trash = '/trash';
  static const String spam = '/spam';
  //email
  static const String emailDetail = '/email/:id';
  static const String compose = '/compose';
}

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.inbox,
  routes: [
    GoRoute(path: Routes.root, redirect: (_, _) => Routes.inbox),

    GoRoute(path: Routes.login, name: 'login', builder: (context, state) => const LoginPage()),
    GoRoute(path: Routes.accountSetup, name: 'account-setup', builder: (context, state) => const AccountSetupPage()),
    GoRoute(path: Routes.settings, name: 'settings', builder: (context, state) => const SettingsPage()),

    //folders
    ShellRoute(
      builder: (context, state, child) => ShellPage(child: child),
      routes: [
        GoRoute(path: Routes.inbox, name: 'inbox', builder: (context, state) => const InboxPage()),
        GoRoute(path: Routes.sent, name: 'sent', builder: (context, state) => const InboxPage()),
        GoRoute(path: Routes.drafts, name: 'drafts', builder: (context, state) => const InboxPage()),
        GoRoute(path: Routes.trash, name: 'trash', builder: (context, state) => const InboxPage()),
        GoRoute(path: Routes.spam, name: 'spam', builder: (context, state) => const InboxPage()),

        //email
        GoRoute(
          path: Routes.emailDetail,
          name: 'email-detail',
          builder: (context, state) {
            final emailId = state.pathParameters['id']!;
            return EmailDetailPage(emailId: emailId);
          },
        ),
        GoRoute(path: Routes.compose, name: 'compose', builder: (context, state) => const ComposePage()),
      ],
    ),
  ],
);
