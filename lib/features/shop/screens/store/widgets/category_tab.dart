import 'package:ecomart/common/widgets/layouts/grid_layout.dart';
import 'package:ecomart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                BrandShowcase(
                  images: const [TImages.productImage1, TImages.productImage2, TImages.productImage3],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                /// Products
                TSectionHeading(title: 'Top Products', showActionButton: true, onPressed: () {},),
                const SizedBox(height: TSizes.spaceBtwItems),

                GridLayout(itemCount: 4, itemBuilder: (_, index) => ProductCardVertical(),),
                const SizedBox(height: TSizes.spaceBtwItems),
              ],
            )
        ),
      ]
    );
  }
}
