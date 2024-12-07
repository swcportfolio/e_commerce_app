import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/presentation/pages/main/component/widgets/svg_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/constant/app_icons.dart';
import '../../../../../core/theme/custom/custom_app_bar.dart';
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
          color: state.theme.backgroundColor,
          child: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: 86,
            centerTitle: true,
            leading: SvgIconButton(
              icon: AppIcons.mainLogo,
              color: state.theme.iconColor,
              padding: 8.0,
            ),
            title: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 0),
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(CustomAppBarTheme.appbarRadius),
                  color: state.theme.containerColor),
              child: IntrinsicWidth(
                child: SizedBox(
                  height: 28,
                  child: DefaultTabController(
                    initialIndex: state.index,
                    length: 2,
                    child: TabBar(
                      tabAlignment: TabAlignment.center,
                      onTap: (index) =>
                          context.read<MallTypeCubit>().changeIndex(index),
                      indicator: BoxDecoration(
                        color: state.theme.indicatorColor,
                        borderRadius: BorderRadius.circular(
                            CustomAppBarTheme.appbarRadius),
                      ),
                      dividerColor: Colors.transparent,
                      labelPadding: EdgeInsets.symmetric(horizontal: 12),
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: state.theme.labelColor,
                      labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                      unselectedLabelColor: state.theme.unselectedLabelColor,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.labelLarge.bold,
                      splashBorderRadius: BorderRadius.all(
                          Radius.circular(CustomAppBarTheme.appbarRadius)),
                      tabs: List.generate(
                        MallType.values.length,
                        (index) => Tab(text: MallType.values[index].label),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              SvgIconButton(
                icon: AppIcons.location,
                color: state.theme.iconColor,
              ),
              SvgIconButton(
                icon: AppIcons.cart,
                color: state.theme.iconColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
