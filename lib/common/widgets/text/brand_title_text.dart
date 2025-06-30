import 'package:flutter/material.dart';
import '../../../utils/constants/enums.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    required this.title,
    this.color,
    this.maxLines = 1,
    this.brandTextSizes = TextSizes.small,
    this.textAlign = TextAlign.center,
  });

  final String title;
  final Color? color;
  final int maxLines;
  final TextSizes brandTextSizes;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          textAlign: textAlign,
          style: brandTextSizes == TextSizes.small
              ? Theme.of(context).textTheme.labelMedium!.copyWith(color: color,)
              : brandTextSizes == TextSizes.medium
                ? Theme.of(context).textTheme.bodyLarge!.copyWith(color: color,)
                : brandTextSizes == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.copyWith(color: color,)
                  : Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,),
    );
  }
}