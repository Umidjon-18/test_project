import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/assets/colors/app_colors.dart';
import 'package:test_project/assets/styles/text_style.dart';
import 'package:test_project/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:test_project/features/auth/presentation/widgets/error_dialog.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.loginEmailController,
    required this.passwordController,
  });

  final TextEditingController loginEmailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(16, 32, 16, 19),
      child: CupertinoButton(
        onPressed: () {
          context.read<AuthenticationBloc>().add(
                LoginEvent(
                  emailOrNickname: loginEmailController.text,
                  password: passwordController.text,
                  onError: (errorMessage) {
                    HapticFeedback.heavyImpact();
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return ErrorDialog(errorMessage: errorMessage);
                      },
                    );
                  },
                ),
              );
        },
        color: AppColors.primaryButton,
        child: Text(
          'Войти',
          style: AppTextStyles.defaultTextStyle.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
