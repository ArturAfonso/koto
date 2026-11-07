import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:koto/core/router/app_router.dart';
import 'package:koto/features/shell/bloc/sidebar_cubit.dart';
import 'package:koto/core/shared/widgets/custombuttom_widget.dart';
import 'package:koto/features/shell/data/folderItem_model.dart';
import 'package:koto/features/shell/presentation/widgets/addacount_butom.dart';
import 'package:koto/features/shell/presentation/widgets/settings_butom.dart';
import 'package:koto/features/shell/presentation/widgets/sidebar_nav_item.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  static final List<FolderItem> _folders = [
    FolderItem(icon: Icons.inbox_outlined, label: 'Caixa de Entrada', badge: 2, route: Routes.inbox),
    FolderItem(icon: Icons.send_outlined, label: 'Enviados', route: Routes.sent),
    FolderItem(icon: Icons.drafts_outlined, label: 'Rascunhos', route: Routes.drafts),
    FolderItem(icon: Icons.delete_outline, label: 'Lixo', route: Routes.trash),
    FolderItem(icon: Icons.warning_amber_outlined, label: 'Spam', route: Routes.spam),
  ];

  static const _collapsedWidth = 72.0;
  static const _expandedWidth = 300.0;
  static const _expandedContentThreshold = 190.0;

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    return BlocBuilder<SidebarCubit, bool>(
      builder: (context, isExpanded) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 10),
          curve: Curves.easeInOut,
          width: isExpanded ? _expandedWidth : _collapsedWidth,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final showExpandedContent = constraints.maxWidth >= _expandedContentThreshold;

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    CustomButton(
                      icon: Icons.post_add_outlined,
                      label: 'Escrever',
                      onTap: () => context.go(Routes.compose),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: _folders.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 2),
                        itemBuilder: (context, index) {
                          final folder = _folders[index];
                          final isSelected = currentPath == folder.route;

                          return SidebarNavItem(
                            key: ValueKey(folder.route),
                            icon: folder.icon,
                            label: folder.label,
                            badgeCount: folder.badge,
                            isSelected: isSelected,
                            isContentExpanded: showExpandedContent,
                            onTap: () => context.go(folder.route),
                          );
                        },
                      ),
                    ),
                    Divider(height: 2, thickness: 2, color: Theme.of(context).dividerColor),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: SettingsButton(isContentExpanded: showExpandedContent),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AddNewAccountButton(isContentExpanded: showExpandedContent),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
