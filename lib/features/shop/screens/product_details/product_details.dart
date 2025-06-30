import 'package:ecomart/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecomart/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecomart/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:ecomart/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecomart/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecomart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../product_reviews/product reviews.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            ProductImageSlider(),
            /// Product Details
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                /// Rating and Share
                children: [
                  RatingAndShare(),
                  /// Price, Title, Stock, and Brand
                  ProductMetaData(),
                  /// Attributes
                  ProductAttributes(),
                  /// Checkout Button
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text('Checkout'))),
                  /// Description
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  const TSectionHeading(title: 'Description'),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  ReadMoreText(
                    'This is the description of the Product and it can go upto max 4 lines. This is the description of the Product and it can go upto max 4 lines. This is the description of the Product and it can go upto max 4 lines',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Reviews(199)', onPressed: () => Get.to(const ProductReviewsScreen())),
                      IconButton(onPressed: () => Get.to(const ProductReviewsScreen()), icon: Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                ],
              ),
            )
          ],
        )
      ),
      bottomNavigationBar: BottomAddToCart(),
    );
  }
}





