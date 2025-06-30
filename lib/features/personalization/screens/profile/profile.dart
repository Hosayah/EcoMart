import 'package:ecomart/common/widgets/appbar/appbar.dart';
import 'package:ecomart/common/widgets/images/circular_image.dart';
import 'package:ecomart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    /// Profile Picture
                    CircularImage(image: TImages.user),
                    TextButton(onPressed: () {}, child: Text('Change Profile Picture'))
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: 'Profile Information'),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(title: 'Name', value: 'Josiah', onPressed: () {}),
              ProfileMenu(title: 'Username', value: 'Josiah', onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: 'Personal Information'),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(title: 'User ID', value: '042866', icon: Iconsax.copy, onPressed: () {}),
              ProfileMenu(title: 'E-mail', value: 'example@gmail.com', onPressed: () {}),
              ProfileMenu(title: 'Phone Number', value: '+63-995-965-2206', onPressed: () {}),
              ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileMenu(title: 'Date of Birth', value: '25 Sept, 2006', onPressed: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              
              Center(
                child: TextButton(onPressed: () {}, child: Text('Close Account', style: TextStyle(color: Colors.red),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}


