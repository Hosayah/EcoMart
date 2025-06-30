import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: isDarkMode ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, left: TSizes.md, right: TSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter promo code here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: isDarkMode ? TColors.white.withAlpha((0.5 * 255).round()) : TColors.dark.withAlpha((0.5 * 255).round()),
                backgroundColor: Colors.grey.withAlpha((0.2 * 255).round()),
                side: BorderSide(color: Colors.grey.withAlpha((0.1 * 255).round())),
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
