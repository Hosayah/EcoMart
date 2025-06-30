import 'package:ecomart/common/widgets/login_signup_widgets/text_divider.dart';
import 'package:ecomart/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecomart/features/authentication/screens/signup/widgets/signup_title.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/login_signup_widgets/grouped_icons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            /// Title
            children: [
              SignupTitle(),
              const SizedBox(height: TSizes.spaceBtwSections),
              /// Form
              SignUpForm(isDarkMode: isDarkMode),
              const SizedBox(height: TSizes.spaceBtwSections),
              /// Divider
              TextDivider(isDarkMode: isDarkMode, dividerText: TTexts.orSignUpWith,),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              /// Social Icons
              SocialGroupedIcons(),
            ],
          ),
        ),
      ),
    );
  }
}




