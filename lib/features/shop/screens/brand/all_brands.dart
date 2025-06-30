import 'package:ecomart/common/widgets/appbar/appbar.dart';
import 'package:ecomart/common/widgets/layouts/grid_layout.dart';
import 'package:ecomart/common/widgets/text/section_heading.dart';
import 'package:ecomart/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_cards.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              TSectionHeading(title: 'Brands'),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Brands
              GridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => BrandCard(showBorder: true, onTap: () => Get.to(const BrandsProducts()),),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
