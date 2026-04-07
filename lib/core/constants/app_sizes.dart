import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._();

  /// Padding & Margin
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  /// Icon Sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  /// Font Sizes
  static const double fontXs = 12.0;
  static const double fontSm = 14.0;
  static const double fontMd = 16.0;
  static const double fontLg = 18.0;
  static const double fontXl = 20.0;
  static const double fontXxl = 24.0;

  /// Border Radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;

  /// Button Heights
  static const double buttonHeightSm = 36.0;
  static const double buttonHeightMd = 48.0;
  static const double buttonHeightLg = 56.0;

  /// AppBar
  static const double appBarHeight = 56.0;

  /// Image Sizes
  static const double imageSm = 40.0;
  static const double imageMd = 80.0;
  static const double imageLg = 120.0;

  /// Spacing Widgets
  static const SizedBox hSpaceXs = SizedBox(height: xs);
  static const SizedBox hSpaceSm = SizedBox(height: sm);
  static const SizedBox hSpaceMd = SizedBox(height: md);
  static const SizedBox hSpaceLg = SizedBox(height: lg);

  static const SizedBox wSpaceXs = SizedBox(width: xs);
  static const SizedBox wSpaceSm = SizedBox(width: sm);
  static const SizedBox wSpaceMd = SizedBox(width: md);
  static const SizedBox wSpaceLg = SizedBox(width: lg);
}
