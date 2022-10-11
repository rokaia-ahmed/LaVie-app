import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;
  bool get isDarkTheme =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
}
