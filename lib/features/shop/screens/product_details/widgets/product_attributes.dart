import 'package:ecomart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecomart/common/widgets/text/product_price_text.dart';
import 'package:ecomart/common/widgets/text/section_heading.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/text/product_title.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        RoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: isDarkMode ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// Title, Price, Stock
              Row(
                children: [
                  TSectionHeading(title: 'Variation'),
                  const SizedBox(width: TSizes.spaceBtwItems,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ProductTitle(name: 'Price : ', smallSize: true,),
                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          /// Sale Price
                          ProductPriceText(price: '20')
                        ],
                      ),
                      /// Stock
                      Row(
                        children: [
                          const ProductTitle(name: 'Stock : ', smallSize: true,),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      )
                    ],
                  ),
                ],
              ),
              /// Variation Description
              ProductTitle(
                name: 'This is the description of the Product and it can go upto max 4 lines.',
                smallSize: true,
                maxLines: 4,
              )
            ]
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: TSizes.sm,
              children: [
                TChoiceChip(label: 'Green', isSelected: true, onSelected: (value) {},),
                TChoiceChip(label: 'Blue', isSelected: false, onSelected: (value) {},),
                TChoiceChip(label: 'Purple', isSelected: false, onSelected: (value) {},)
              ],
            )
          ]
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Sizes'),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Wrap(
                spacing: TSizes.sm,
                children: [
                  TChoiceChip(label: 'EU 38', isSelected: true, onSelected: (value) {}),
                  TChoiceChip(label: 'EU 39', isSelected: false, onSelected: (value) {}),
                  TChoiceChip(label: 'EU 40', isSelected: false, onSelected: (value) {})
                ],
              )
            ]
        ),
      ],
    );
  }
}


