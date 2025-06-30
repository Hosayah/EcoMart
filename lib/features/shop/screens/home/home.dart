import 'package:ecomart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecomart/features/shop/screens/all_products/all_products.dart';
import 'package:ecomart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecomart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecomart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecomart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/home_controller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  const HomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  /// SearchBar
                  const SearchContainer(text: 'Search for products', icon: Iconsax.search_normal,),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        TSectionHeading(title: 'Product Categories', showActionButton: false, textColor: TColors.grey,),
                        const SizedBox(height: TSizes.spaceBtwItems,),
                        /// Scrollable Categories
                        HomeCategories(),
                      ],
                    )
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                ],
              ),
            ),
            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  PromoSlider(banners: [TImages.banner1, TImages.banner2, TImages.banner3],),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  /// Heading

                  TSectionHeading(title: 'Popular Products',showActionButton: true, actionText: 'View All', onPressed: () => Get.to(const AllProducts()),),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// Popular Products
                  GridLayout(itemCount: 8, itemBuilder: (context, index) => ProductCardVertical(),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}























