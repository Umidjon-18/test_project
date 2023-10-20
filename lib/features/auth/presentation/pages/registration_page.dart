import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/assets/colors/app_colors.dart';
import 'package:test_project/assets/styles/text_style.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:test_project/features/auth/presentation/widgets/login_button.dart';
import 'package:test_project/features/auth/presentation/widgets/register_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController loginEmailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: const CupertinoNavigationBar(
          border: null,
          middle: Text('Авторизация', style: AppTextStyles.navTitleTextStyle),
          backgroundColor: AppColors.white,
        ),
        backgroundColor: AppColors.pageBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField.borderless(
              controller: loginEmailController,
              placeholder: 'Логин или почта',
              decoration: const BoxDecoration(color: AppColors.white),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              placeholderStyle: AppTextStyles.defaultTextStyle.copyWith(color: AppColors.secondaryText),
            ),
            const Divider(height: 1, indent: 16, endIndent: 16),
            CupertinoTextField.borderless(
              controller: passwordController,
              placeholder: 'Пароль',
              decoration: const BoxDecoration(color: AppColors.white),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              placeholderStyle: AppTextStyles.defaultTextStyle.copyWith(color: AppColors.secondaryText),
            ),
            LoginButton(
              loginEmailController: loginEmailController,
              passwordController: passwordController,
            ),
            const RegisterButton(),
          ],
        ),
      ),
    );
  }
}

