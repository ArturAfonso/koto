import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Responsive {
  Responsive._();

  // Breakpoints de tamanho de janela (só relevantes no desktop)
  static const double _compactDesktop = 600;
  static const double _wideDesktop = 1200;

  // ─── Plataforma ──────────────────────────────────────────────

  static bool get isMobilePlatform => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  static bool get isDesktopPlatform => !kIsWeb && (Platform.isLinux || Platform.isWindows || Platform.isMacOS);

  // ─── Contexto de interação (o que você usa nas páginas) ──────

  /// Usuário está em dispositivo touch (Android/iOS).
  /// Independe do tamanho da tela.
  static bool isMobile(BuildContext context) => isMobilePlatform;

  /// Desktop com janela grande — exibe layouts completos (Gmail/Outlook style).
  static bool isWideDesktop(BuildContext context) =>
      isDesktopPlatform && MediaQuery.sizeOf(context).width >= _wideDesktop;

  /// Desktop com janela pequena — janela redimensionada pelo usuário.
  static bool isCompactDesktop(BuildContext context) =>
      isDesktopPlatform && MediaQuery.sizeOf(context).width < _wideDesktop;

  // ─── Builder helper (evita LayoutBuilder repetido nas páginas) ─

  static Widget builder({
    required BuildContext context,
    required Widget mobile,
    Widget? compactDesktop,
    required Widget wideDesktop,
  }) {
    if (isMobile(context)) {
      debugPrint('Responsive.builder: mobile layout');
      return mobile;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        /*  if (constraints.maxWidth < _wideDesktop) return compactDesktop;
        return wideDesktop; */
        debugPrint('Responsive.builder: desktop layout, width=${constraints.maxWidth}');
        if (constraints.maxWidth < _wideDesktop) return compactDesktop ?? wideDesktop;
        return wideDesktop;
      },
    );
  }
}
