import 'package:flutter/material.dart';
import 'package:whatever_app/utils/constants/colors.dart';
import 'package:whatever_app/utils/device/device_utility.dart';
import 'package:whatever_app/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Material(
      color: darkMode ? TColors.black : TColors.white,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: darkMode ? TColors.white : TColors.primary,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
