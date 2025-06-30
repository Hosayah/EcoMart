import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Obx(() => Checkbox(value: controller.isAgree.value, onChanged: (value) => controller.isAgree.value = value!,))),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
              children: [
                TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: TTexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isDarkMode ? TColors.white : TColors.primaryColor, decoration: TextDecoration.underline, decorationColor: isDarkMode ? TColors.white : TColors.primaryColor)),
                TextSpan(text: " ${TTexts.and} ", style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: TTexts.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isDarkMode ? TColors.white : TColors.primaryColor, decoration: TextDecoration.underline, decorationColor: isDarkMode ? TColors.white : TColors.primaryColor)),
              ]
          ),
        ),
      ],
    );
  }
}