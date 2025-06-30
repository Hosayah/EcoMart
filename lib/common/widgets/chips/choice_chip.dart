import 'package:ecomart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key, required this.label, required this.isSelected, this.onSelected,
  });

  final String label;
  final bool isSelected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(label) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? SizedBox() : Text(label),
        selected: isSelected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: isSelected ? TColors.white : null),
        avatar: isColor
            ? TCircularContainer(width: 50, height: 50, backgroundColor: THelperFunctions.getColor(label)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        selectedColor: isColor ? THelperFunctions.getColor(label)!.withAlpha((0.9 * 255).round()) : null,
        backgroundColor: isColor ? THelperFunctions.getColor(label)! : null,
      ),
    );
  }
}