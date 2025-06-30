import 'package:ecomart/common/widgets/appbar/appbar.dart';
import 'package:ecomart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecomart/common/widgets/text/section_heading.dart';
import 'package:ecomart/features/personalization/screens/address/address.dart';
import 'package:ecomart/features/shop/screens/order/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list/settings_menu_tile.dart';
import '../../../../common/widgets/list/user_profile_tile.dart';
import '../../../../datas/repositories/authentication/auth_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/cart/cart.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// User Profile Card
                  UserProfileTile(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            /// Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  TSectionHeading(title: 'Account Settings'),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  SettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Manage your delivery addresses', onTap: () => Get.to(const AddressScreen()),),
                  SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'View Shopping Cart', onTap: () => Get.to(const CartScreen()),),
                  SettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'Manage your orders', onTap: () => Get.to(const OrderScreen()),),
                  SettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account', onTap: () {},),
                  SettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'Check your available coupons', onTap: () {},),
                  SettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message', onTap: () {},),
                  SettingsMenuTile(icon: Iconsax.security_card, title: 'My Addresses', subTitle: 'Manage data usage and connected accounts', onTap: () {},),

                  /// App settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'App Settings'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload your Data', onTap: () {},),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                    onTap: () {},),
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                    onTap: () {},),
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                    onTap: () {},),

                  /// Logout
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: AuthenticationRepository.instance.logout, child: Text('Logout', style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.primaryColor)),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


