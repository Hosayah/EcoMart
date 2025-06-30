import 'package:ecomart/common/styles/spacing_styles.dart';
import 'package:ecomart/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecomart/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/login_signup_widgets/grouped_icons.dart';
import '../../../../common/widgets/login_signup_widgets/text_divider.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo Title and Sub-Title
              LoginHeader(isDarkMode: isDarkMode),
              /// Form
              LoginForm(),
              /// Divider
              TextDivider(isDarkMode: isDarkMode, dividerText: TTexts.orSignInWith),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              /// Footer
              SocialGroupedIcons(),
            ],
          ),
        ),
      ),
    );
  }
}






