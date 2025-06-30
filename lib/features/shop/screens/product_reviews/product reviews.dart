import 'package:ecomart/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:ecomart/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_bar_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Reviews and ratings are verified and are from people who use the same platform.'),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Overall Product Ratings
              const OverallProductRating(),
              const TRatingBarIndicator(rating: 4.5,),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// User Reviews
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ]
          ),
        ),
      ),
    );
  }
}




