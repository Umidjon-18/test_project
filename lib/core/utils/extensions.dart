import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  CupertinoTextThemeData? get textTheme => Theme.of(this).cupertinoOverrideTheme?.textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  Size get sizeOf => MediaQuery.sizeOf(this);
}
