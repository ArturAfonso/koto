

import 'package:flutter/material.dart';

class FolderItem {
   FolderItem({
    required this.icon,
    required this.label,
    this.badge,
  });

  final IconData icon;
  final String label;
  final int? badge;
}