import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key, required this.onPressed, this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Iconsax.shopping_cart, color: iconColor,)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black.withAlpha((0.8 * 255).round()),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white))),
          ),
        ),
      ],
    );
  }
}