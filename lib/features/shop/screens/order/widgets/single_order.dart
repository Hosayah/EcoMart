import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SingleOrder extends StatelessWidget {
  const SingleOrder({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: isDarkMode ? TColors.dark : TColors.light,
      padding: EdgeInsets.all(TSizes.md),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Icon
                Icon(Iconsax.ship),
                const SizedBox(width: TSizes.sm,),

                /// Status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primaryColor, fontWeightDelta: 1),),
                      Text('25 Sept, 2025', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm,))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Icon
                      Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.sm,),

                      /// Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.primaryColor, fontWeightDelta: 1),),
                            Text('[#042866]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Icon
                      Icon(Iconsax.calendar),
                      const SizedBox(width: TSizes.sm,),

                      /// Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.primaryColor, fontWeightDelta: 1),),
                            Text('30 Sept, 2025', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ]
      ),
    );
  }
}
