import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../category/category_page.dart';
import '../home/home_page.dart';
import '../search/search_page.dart';
import '../user/user_page.dart';
import 'component/top_app_bar/top_app_bar.dart';
import 'cubit/bottom_nav_cubit.dart';
import 'cubit/mall_type_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (_) => MallTypeCubit(),
        ),
      ],
      child: MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (context, state) {
          switch (state) {
            case BottomNav.home:
              return HomePage();
            case BottomNav.category:
              return CategoryPage();
            case BottomNav.search:
              return SearchPage();
            case BottomNav.user:
              return UserPage();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: List.generate(
              BottomNav.values.length,
              (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(BottomNav.values[index].icon),
                label: BottomNav.values[index].label,
                activeIcon:
                    SvgPicture.asset(BottomNav.values[index].activeIcon),
              ),
            ),
            onTap: (index) => context.read<BottomNavCubit>().changeIndex(index),
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          );
        },
      ),
    );
  }
}
