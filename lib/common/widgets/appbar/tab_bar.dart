import 'package:ecomart/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Tab> tabs;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Material(
      color: isDarkMode ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: TColors.primaryColor,
        unselectedLabelColor: TColors.darkerGrey,
        labelColor: isDarkMode ? TColors.white : TColors.primaryColor,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
