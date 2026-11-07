import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:koto/core/di/injection.dart';
import 'package:koto/core/router/app_router.dart';
import 'package:koto/core/theme/app_colors.dart';
import 'package:koto/core/theme/theme_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final bg = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final card = isDark ? AppColors.darkCard : AppColors.lightCard;
    final border = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final foreground = isDark ? AppColors.darkForeground : AppColors.lightForeground;
    final muted = isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;

    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          _buildAppBar(context, foreground, primary, muted),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCard(
                        context,
                        card: card,
                        border: border,
                        foreground: foreground,
                        muted: muted,
                        primary: primary,
                        isDark: isDark,
                      ),
                      const SizedBox(height: 32),
                      _buildFooter(muted, primary),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, Color foreground, Color primary, Color muted) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        if (state == ThemeMode.light || state == ThemeMode.dark) {
          return Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Image.asset(
                  state == ThemeMode.dark
                      ? 'assets/images/dark-icon-resized-cut.png'
                      : 'assets/images/light-Icon-resized-cut.png',
                  width: 40,
                  height: 40,
                ),

                const SizedBox(width: 10),
                Text(
                  'Koto Mail',
                  style: TextStyle(color: foreground, fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Inter'),
                ),
                const Spacer(),
                Icon(Icons.language, color: muted, size: 18),
                const SizedBox(width: 6),
                Text(
                  'Português (Brasil)',
                  style: TextStyle(color: muted, fontSize: 13, fontFamily: 'Inter'),
                ),
                Icon(Icons.keyboard_arrow_down, color: muted, size: 18),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required Color card,
    required Color border,
    required Color foreground,
    required Color muted,
    required Color primary,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Iniciar sessão',
            style: TextStyle(color: foreground, fontSize: 24, fontWeight: FontWeight.w700, fontFamily: 'Inter'),
          ),
          const SizedBox(height: 8),
          Text(
            'Para continuar para o Koto Mail',
            style: TextStyle(color: muted, fontSize: 14, fontFamily: 'Inter'),
          ),
          const SizedBox(height: 32),
          Text(
            'E-mail ou nome de usuário',
            style: TextStyle(color: foreground, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Inter'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _emailController,
            style: TextStyle(color: foreground, fontFamily: 'Inter'),
            decoration: const InputDecoration(hintText: ''),
          ),
          const SizedBox(height: 20),
          Text(
            'Senha',
            style: TextStyle(color: foreground, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Inter'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            style: TextStyle(color: foreground, fontFamily: 'Inter'),
            decoration: InputDecoration(
              hintText: '',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: muted,
                  size: 20,
                ),
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                context.go(Routes.inbox);
              },
              child: const Text(
                'Iniciar sessão',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: muted, fontSize: 13, fontFamily: 'Inter'),
                children: [
                  const TextSpan(text: 'Novo no Koto? '),
                  TextSpan(
                    text: 'Criar conta',
                    style: TextStyle(color: primary, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Divider(color: border),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Problemas para iniciar sessão?',
              style: TextStyle(color: primary, fontSize: 13, fontFamily: 'Inter'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(Color muted, Color primary) {
    return Column(
      children: [
        Text(
          'Koto Mail. Privacy by default.',
          style: TextStyle(color: muted, fontSize: 12, fontFamily: 'Inter'),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Termos',
              style: TextStyle(color: primary, fontSize: 12, fontFamily: 'Inter'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('|', style: TextStyle(color: muted, fontSize: 12)),
            ),
            Text(
              'Política de privacidade',
              style: TextStyle(color: primary, fontSize: 12, fontFamily: 'Inter'),
            ),
          ],
        ),
      ],
    );
  }
}
