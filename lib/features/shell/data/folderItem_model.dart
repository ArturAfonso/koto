import 'package:flutter/material.dart';

class FolderItem {
  FolderItem({required this.icon, required this.label, this.badge, required this.route});

  final IconData icon;
  final String label;
  final String route;
  final int? badge;
}
