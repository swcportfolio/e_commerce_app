import 'package:flutter/material.dart';

import '../../cubit/bottom_nav_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  final BottomNav bottomNav;

  const DefaultAppBar({required this.bottomNav, super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(44),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        color: Theme.of(context).colorScheme.surface,
        child: AppBar(
          title: Text(bottomNav.label),
          backgroundColor: Colors.transparent,
          leadingWidth: 86,
        ),
      ),
    );
  }
}
