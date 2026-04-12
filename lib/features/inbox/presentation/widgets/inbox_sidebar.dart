import 'package:flutter/material.dart';
import 'package:koto/core/shared/widgets/custombuttom_widget.dart';
import 'package:koto/features/inbox/data/folderItem_model.dart';
import 'package:koto/features/inbox/presentation/widgets/addacount_butom.dart';
import 'package:koto/features/inbox/presentation/widgets/settings_butom.dart';
import 'package:koto/features/inbox/presentation/widgets/sidebarNavItem%20.dart';

class InboxSidebar extends StatefulWidget {
  const InboxSidebar({super.key});

  @override
  State<InboxSidebar> createState() => _InboxSidebarState();
}

class _InboxSidebarState extends State<InboxSidebar> {
  int _selectedIndex = 0;

  static final List<FolderItem> _folders = [
    FolderItem(icon: Icons.inbox_outlined,         label: 'Caixa de Entrada', badge: 2),
     FolderItem(icon: Icons.send_outlined,           label: 'Enviados'),
     FolderItem(icon: Icons.drafts_outlined,         label: 'Rascunhos'),
     FolderItem(icon: Icons.delete_outline,          label: 'Lixo'),
     FolderItem(icon: Icons.warning_amber_outlined,  label: 'Spam'),
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //const SidebarHeader(),
             Divider(height: 1, color: Theme.of(context).dividerColor),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),

              child: CustomButton(
                icon: Icons.post_add_outlined,
                label: 'Escrever',
                onTap: () {
                 print('novo email');
                },),
              ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: _folders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 2),
                itemBuilder: (context, index) {
                  final folder = _folders[index];
                  return SidebarNavItem(
                    icon: folder.icon,
                    label: folder.label,
                    badgeCount: folder.badge,
                    isSelected: _selectedIndex == index,
                    onTap: () => setState(() => _selectedIndex = index),
                  );
                },
              ),
            ),
             Divider(height: 2,
             thickness: 2, color: Theme.of(context).dividerColor),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child:  SettingsButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child:  AddNewAccountButton(),
            ),
             //SidebarFooter(),
          ],
        ),
      ),
    );
  }
}