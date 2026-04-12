


import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: 2,
      thickness: 2,
      color: Theme.of(context).dividerColor,
    );
  }
}