import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
class TextDivider extends StatelessWidget {
  const TextDivider({
    super.key,
    required this.isDarkMode,
    required this.dividerText,
  });

  final bool isDarkMode;
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: isDarkMode ? TColors.darkGrey : TColors.grey, thickness: 1, indent: 60, endIndent: 5,),),
        Text(dividerText, style: Theme.of(context).textTheme.bodyMedium),
        Flexible(child: Divider(color: isDarkMode ? TColors.darkGrey : TColors.grey, thickness: 1, indent: 5, endIndent: 60,),),
      ],
    );
  }
}