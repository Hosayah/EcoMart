import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_images.dart';
import '../../text/brand_title_text_with_verified_icon.dart';
import '../../text/product_price_text.dart';
import '../../text/product_title.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {Get.to(ProductDetail());},
      child: Container(
          width: 310,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: isDarkMode ? TColors.darkerGrey : TColors.softGrey,
          ),
          child: Row(
            children: [
              /// Thumbnail
              RoundedContainer(
                height: 120,
                padding: EdgeInsets.all(TSizes.sm),
                backgroundColor: isDarkMode ? TColors.dark : TColors.light,
                child: Stack(
                  /// Thumbnail Image
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: RoundedImage(
                        imageUrl: TImages.productImage1,
                        applyImageRadius: true,
                      ),
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
              /// Details
              SizedBox(
                width: 170,
                child: Padding(
                  padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitle(name: 'Green Nike Half Sleeves Shirt', smallSize: true,),
                          const SizedBox(height: TSizes.spaceBtwItems / 2,),
                          BrandTitleTextWithVerifiedIcon(title: 'Nike'),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Pricing
                          Flexible(child: ProductPriceText(price: '256.0',)),

                          /// Add to Cart
                          Container(
                            decoration: BoxDecoration(
                                color: TColors.dark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(TSizes.cardRadiusLg),
                                  bottomRight: Radius.circular(TSizes.productImageRadius),
                                )
                            ),
                            child: SizedBox(
                              width: TSizes.iconLg * 1.2,
                              height: TSizes.iconLg * 1.2,
                              child: Center(child: Icon(Iconsax.add, color: TColors.white,)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}
