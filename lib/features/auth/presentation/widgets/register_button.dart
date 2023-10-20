import 'package:flutter/cupertino.dart';
import 'package:test_project/assets/colors/app_colors.dart';
import 'package:test_project/assets/styles/text_style.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoButton(
        onPressed: () {},
        color: AppColors.primaryButton,
        child: Text(
          'Зарегистрироваться',
          style: AppTextStyles.defaultTextStyle.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
