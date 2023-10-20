import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:test_project/assets/colors/app_colors.dart';
import 'package:test_project/assets/styles/text_style.dart';
import 'package:test_project/features/profile/presentation/widgets/logout_dialog.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 27),
      child: CupertinoButton(
        color: AppColors.white,
        pressedOpacity: .1,
        borderRadius: BorderRadius.zero,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 29),
        child: Text(
          'Выйти',
          style: AppTextStyles.defaultTextStyle.copyWith(
            color: AppColors.danger,
          ),
        ),
        onPressed: () {
          HapticFeedback.heavyImpact();
          showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) => const LogoutDialog(),
          );
        },
      ),
    );
  }
}
