import 'package:flutter/material.dart';
import 'package:koto/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  // Border radius tokens do design system
  static const double radiusDefault = 8.0;
  static const double radiusMd = 6.0;
  static const double radiusSm = 4.0;

  // Dimensões estruturais
  static const double sidebarWidth = 224.0;
  static const double emailListWidth = 320.0;

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.lightForeground,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.lightForeground,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.lightMutedForeground,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.lightMutedForeground,
          ),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.lightPrimary,
          onPrimary: AppColors.lightPrimaryForeground,
          secondary: AppColors.lightSecondary,
          onSecondary: AppColors.lightSecondaryForeground,
          surface: AppColors.lightCard,
          onSurface: AppColors.lightCardForeground,
          error: AppColors.lightDestructive,
          onError: AppColors.lightDestructiveForeground,
          outline: AppColors.lightBorder,
          outlineVariant: AppColors.lightInput,
          shadow: Colors.black12,
          scrim: Colors.black26,
          inverseSurface: AppColors.darkCard,
          onInverseSurface: AppColors.darkCardForeground,
          inversePrimary: AppColors.darkPrimary,
          surfaceContainerHighest: AppColors.lightMuted,
          onSurfaceVariant: AppColors.lightMutedForeground,
          tertiaryContainer: AppColors.lightAccent,
          onTertiaryContainer: AppColors.lightAccentForeground,
        ),
        scaffoldBackgroundColor: AppColors.lightBackground,
        cardColor: AppColors.lightCard,
        dividerColor: AppColors.lightEmailDivider,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: AppColors.lightCard,
          foregroundColor: AppColors.lightForeground,
          surfaceTintColor: Colors.transparent,
        ),
        cardTheme: CardThemeData(
          color: AppColors.lightCard,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusDefault),
            side: const BorderSide(color: AppColors.lightBorder),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.lightCard,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide: const BorderSide(color: AppColors.lightInput),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide: const BorderSide(color: AppColors.lightInput),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide:
                const BorderSide(color: AppColors.lightRing, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightPrimary,
            foregroundColor: AppColors.lightPrimaryForeground,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusMd),
            ),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.lightEmailDivider,
          thickness: 1,
          space: 1,
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.darkForeground,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.darkForeground,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.darkMutedForeground,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.darkMutedForeground,
          ),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.darkPrimary,
          onPrimary: AppColors.darkPrimaryForeground,
          secondary: AppColors.darkSecondary,
          onSecondary: AppColors.darkSecondaryForeground,
          surface: AppColors.darkCard,
          onSurface: AppColors.darkCardForeground,
          error: AppColors.darkDestructive,
          onError: AppColors.darkDestructiveForeground,
          outline: AppColors.darkBorder,
          outlineVariant: AppColors.darkInput,
          shadow: Colors.black45,
          scrim: Colors.black54,
          inverseSurface: AppColors.lightCard,
          onInverseSurface: AppColors.lightCardForeground,
          inversePrimary: AppColors.lightPrimary,
          surfaceContainerHighest: AppColors.darkMuted,
          onSurfaceVariant: AppColors.darkMutedForeground,
          tertiaryContainer: AppColors.darkAccent,
          onTertiaryContainer: AppColors.darkAccentForeground,
        ),
        scaffoldBackgroundColor: AppColors.darkBackground,
        cardColor: AppColors.darkCard,
        dividerColor: AppColors.darkEmailDivider,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: AppColors.darkCard,
          foregroundColor: AppColors.darkForeground,
          surfaceTintColor: Colors.transparent,
        ),
        cardTheme: CardThemeData(
          color: AppColors.darkCard,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusDefault),
            side: const BorderSide(color: AppColors.darkBorder),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkSecondary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide: const BorderSide(color: AppColors.darkInput),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide: const BorderSide(color: AppColors.darkInput),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide:
                const BorderSide(color: AppColors.darkRing, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPrimary,
            foregroundColor: AppColors.darkPrimaryForeground,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusMd),
            ),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.darkEmailDivider,
          thickness: 1,
          space: 1,
        ),
      );
}