import 'package:ecomart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecomart/common/widgets/success_screen/success_screen.dart';
import 'package:ecomart/features/shop/screens/checkout/widgets/billing_address_secion.dart';
import 'package:ecomart/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecomart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../nav_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              const CartItems(showAddRemoveButtons: false,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Add Coupon
              CouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Billing Section
              RoundedContainer(
                showBorder: true,
                backgroundColor: isDarkMode ? TColors.black : TColors.white,
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    /// Pricing

                    const SizedBox(height: TSizes.spaceBtwItems,),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems,),

                    /// Payment Methods
                    BillingPaymentSection(),

                    /// Address
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    BillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(SuccessScreen(image: TImages.successfulPaymentIcon, title: 'Payment Success!', subtitle: 'Your item will be shipped soon', onPressed: () => Get.offAll(() => const NavMenu()))),
          child: Text('Checkout \$256',),
        ),
      ),
    );
  }
}

