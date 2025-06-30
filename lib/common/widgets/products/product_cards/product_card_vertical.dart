import 'package:ecomart/common/styles/shadows.dart';
import 'package:ecomart/common/widgets/images/rounded_images.dart';
import 'package:ecomart/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:ecomart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../text/product_price_text.dart';
import '../../text/product_title.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {Get.to(ProductDetail());},
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: isDarkMode ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount tag
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: isDarkMode ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  ///  Thumbnail Image
                  RoundedImage(
                    imageUrl: TImages.productImage9,
                    applyImageRadius: true,
                  ),
      
                  /// Sale tag
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondaryColor.withAlpha((0.8*255).round()),
                      padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.copyWith(color: TColors.black,),
                      ),
                    ),
                  ),
      
                  /// Favorite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(icon: Iconsax.heart5, color: Colors.red,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2,),
            /// Details
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitle(name: 'Red Nike Shoes', smallSize: true,),
                    const SizedBox(height: TSizes.spaceBtwItems / 2,),
                    BrandTitleTextWithVerifiedIcon(title: 'Nike'),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Price
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.sm),
                    child: ProductPriceText(price: '35',),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      ),

                    ),
                    child: SizedBox(
                      width: TSizes.iconLg,
                      height: TSizes.iconLg,
                      child: Center(child: Icon(Iconsax.add, color: TColors.white,)),
                    ),

                  )
                ]
            ),
          ]
        )
      ),
    );
  }
}







