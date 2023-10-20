import 'package:flutter/cupertino.dart';
import 'package:test_project/assets/colors/app_colors.dart';
import 'package:test_project/assets/styles/text_style.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Ошибка',
        style: AppTextStyles.navTitleTextStyle.copyWith(color: AppColors.danger),
      ),
      content: Text(errorMessage),
    );
  }
}
