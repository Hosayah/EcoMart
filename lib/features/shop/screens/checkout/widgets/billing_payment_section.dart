import 'package:ecomart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecomart/common/widgets/text/section_heading.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method', showActionButton: true, actionText: 'Change', onPressed: () {},),
        const SizedBox(height: TSizes.sm),

        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: isDarkMode ? TColors.light : TColors.white,
              padding: EdgeInsets.all(TSizes.sm),
              child: Image(image: AssetImage(TImages.paypal)),
            ),
            const SizedBox(width: TSizes.sm,),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),
      ],
    );
  }
}
