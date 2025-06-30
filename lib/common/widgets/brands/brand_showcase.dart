import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_cards.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key, required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(TSizes.md),
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with products count
          BrandCard(showBorder: false,),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Products
          Row(
            children: images.map((image) => brandTopProductsImageWidget(context, image)).toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductsImageWidget(BuildContext context, String image) {
  return Expanded(
      child: RoundedContainer(
        height: 100,
        margin: EdgeInsets.only(right: TSizes.sm),
        padding: EdgeInsets.all(TSizes.md),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        child: Image(image: AssetImage(image), fit: BoxFit.contain,),
      )
  );
}
