import 'package:ecomart/features/personalization/screens/settings/settings.dart';
import 'package:ecomart/features/shop/screens/home/home.dart';
import 'package:ecomart/features/shop/screens/store/store.dart';
import 'package:ecomart/utils/constants/colors.dart';
import 'package:ecomart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/wishlist/wishlist.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavController());
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (value) => controller.selectedIndex.value = value,
          backgroundColor: isDarkMode ? TColors.black : TColors.white,
          indicatorColor: isDarkMode ? TColors.white.withAlpha((0.1 * 255).round()) : TColors.black.withAlpha((0.1 * 255).round()),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomeScreen(), const StoreScreen(), const FavouriteScreen(), const SettingsScreen()];
}
