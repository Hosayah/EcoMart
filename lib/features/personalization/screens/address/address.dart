import 'package:ecomart/common/widgets/appbar/appbar.dart';
import 'package:ecomart/features/personalization/screens/address/add_new_address.dart';
import 'package:ecomart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: true),
              SingleAddress(selectedAddress: false),
            ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: TColors.primaryColor, onPressed: () => Get.to(const AddNewAddressScreen()), child: Icon(Iconsax.add, color: TColors.white,),),
    );
  }
}
