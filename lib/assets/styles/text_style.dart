import 'package:flutter/cupertino.dart';
import 'package:test_project/assets/colors/app_colors.dart';

class AppTextStyles {
  static const defaultTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.dark,
  );
  static const navTitleTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
  );
  static const actionTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.danger,
  );
  static const titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
  );
}