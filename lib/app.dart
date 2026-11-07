import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:koto/core/di/injection.dart';

import 'package:koto/core/router/app_router.dart';
import 'package:koto/core/shared/bloc/layout_preference_cubit.dart';
import 'package:koto/features/shell/bloc/sidebar_cubit.dart';
import 'package:koto/core/theme/app_theme.dart';
import 'package:koto/core/theme/theme_cubit.dart';

class KotoApp extends StatelessWidget {
  const KotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit(sl<FlutterSecureStorage>())..loadTheme()),
        BlocProvider<LayoutPreferenceCubit>(
          create: (_) => LayoutPreferenceCubit(sl<FlutterSecureStorage>())..loadLayout(),
        ),
        BlocProvider<SidebarCubit>(create: (context) => SidebarCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'Koto Mail',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}

/* 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      bloc: sl<ThemeCubit>(),
      builder: (context, themeMode) {
        return MaterialApp.router(
          title: 'Koto Mail',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          routerConfig: appRouter,
        );
      },
    );
  }
} */
