import 'package:ecomart/features/shop/screens/order/widgets/single_order.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems,),
      itemBuilder: (_, index) => SingleOrder(),
    );
  }
}

