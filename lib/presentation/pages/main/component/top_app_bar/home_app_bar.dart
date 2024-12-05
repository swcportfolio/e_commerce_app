import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/constant/app_icons.dart';
import '../../cubit/mall_type_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          color: (state.isMarket)
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          child: AppBar(
            leading: Container(
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                AppIcons.mainLogo,
                colorFilter: ColorFilter.mode(
                  (state.isMarket)
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: DefaultTabController(
              initialIndex: state.index,
              length: MallType.values.length,
              child: TabBar(
                onTap: (index) =>
                    context.read<MallTypeCubit>().changeIndex(index),
                labelColor: Theme.of(context).colorScheme.surface,
                unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
                tabs: List.generate(
                  MallType.values.length,
                  (index) => Tab(text: MallType.values[index].label),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  AppIcons.location,
                  width: 32,
                  colorFilter: ColorFilter.mode(
                    (state.isMarket)
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.contentPrimary,
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
                    (state.isMarket)
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.contentPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            leadingWidth: 86,
          ),
        );
      },
    );
  }
}
