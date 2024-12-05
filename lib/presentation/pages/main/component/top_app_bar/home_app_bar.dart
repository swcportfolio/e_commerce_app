

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/constant/app_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(44),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        color: Theme.of(context).colorScheme.primary,
        child: AppBar(
          leading: Container(
            padding: EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.primary,
            child: SvgPicture.asset(
              AppIcons.mainLogo,
            ),
          ),
          title: const Text('TabBar'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.location,
                width: 32,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.surface,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.cart,
                width: 32,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.surface,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          leadingWidth: 86,
        ),
      ),
    );
  }
}
