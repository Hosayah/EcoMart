import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width= 56,
    this.height =56,
    this.padding = TSizes.sm,
    this.overlayColor,
    this.backgroundColor,
    this.fit,
    required this.image,
    this.isNetworkImage = false,
  });

  final double width,height, padding;
  final Color? overlayColor, backgroundColor;
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
        color: overlayColor,
      ),

    );
  }
}
