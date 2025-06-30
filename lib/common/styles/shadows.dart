import 'package:flutter/material.dart';

class ShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: Colors.grey.withAlpha((0.1 * 255).round()),
    spreadRadius: 7,
    blurRadius: 50,
    offset: Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: Colors.grey.withAlpha((0.1 * 255).round()),
    spreadRadius: 7,
    blurRadius: 50,
    offset: Offset(0, 2),
  );
}