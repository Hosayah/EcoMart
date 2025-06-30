import 'package:ecomart/common/widgets/appbar/appbar.dart';
import 'package:ecomart/features/shop/screens/order/widgets/order_list_items.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// Orders
        child: OrderListItems(),
      ),
    );
  }
}
