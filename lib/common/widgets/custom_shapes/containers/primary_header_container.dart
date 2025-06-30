import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/custom_edge_widget.dart';
import 'circular_container.dart';
class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: TColors.primaryColor,
        padding: EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(backgroundColor: TColors.textWhite.withAlpha((0.1 * 255).round()),),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(backgroundColor: TColors.textWhite.withAlpha((0.1 * 255).round()),),
            ),
            child
          ],
        ),
      ),
    );
  }
}