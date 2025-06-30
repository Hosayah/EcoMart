import 'package:ecomart/common/widgets/appbar/appbar.dart';
import 'package:ecomart/common/widgets/images/rounded_images.dart';
import 'package:ecomart/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecomart/common/widgets/text/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sub Category'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              RoundedImage(imageUrl: TImages.promoBanner1, width: double.infinity, height: null, applyImageRadius: true,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  TSectionHeading(title: 'Sports shirts', onPressed: () {},),
                  const SizedBox(height: TSizes.sm,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => ProductCardHorizontal(),
                    ),
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
