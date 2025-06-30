import 'package:ecomart/common/widgets/appbar/appbar.dart';
import 'package:ecomart/common/widgets/layouts/grid_layout.dart';
import 'package:ecomart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecomart/common/widgets/text/section_heading.dart';
import 'package:ecomart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecomart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/tab_bar.dart';
import '../../../../common/widgets/brands/brand_cards.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../brand/all_brands.dart';
import '../cart/cart.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            CartCounterIcon(onPressed: () => Get.to(const CartScreen()),)
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 420,
      
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      SearchContainer(text: 'Search for products', icon: Iconsax.search_normal,showBorder: true, showBackground: false,padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      
                      /// Featured Brands
                      TSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(const AllBrandsScreen()), showActionButton: true,),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      
                      GridLayout(itemCount: 4, mainAxisExtent: 80,  itemBuilder: (_, index) {
                        return BrandCard(showBorder: false,);
                      },
                      ),
                    ],
                  ),
      
                ),
                /// Tabs
                bottom: TTabBar(
                  tabs: [
                    Tab(child: Text('Sports'),),
                    Tab(child: Text('Furniture'),),
                    Tab(child: Text('Electronics'),),
                    Tab(child: Text('Clothes'),),
                    Tab(child: Text('Cosmetics'),),
                  ]
                )
              ),
            ];
          },
          body: TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}




