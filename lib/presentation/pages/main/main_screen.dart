import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/constant/app_icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Main Screen',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.navHome),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.navCategory),
              label: 'category',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.navSearch),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.navUser),
              label: 'user',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
      ),
    );
  }
}