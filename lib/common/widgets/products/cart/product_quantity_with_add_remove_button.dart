import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.dark,
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),

        const SizedBox(width: TSizes.spaceBtwItems,),
        Text('2', style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: TSizes.spaceBtwItems,),

        /// Add
        CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primaryColor,
        ),
      ],
    );
  }
}
