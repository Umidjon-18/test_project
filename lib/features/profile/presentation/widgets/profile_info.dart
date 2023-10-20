import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/assets/colors/app_colors.dart';
import 'package:test_project/assets/constants/app_icons.dart';
import 'package:test_project/assets/styles/text_style.dart';
import 'package:test_project/features/auth/presentation/bloc/authentication_bloc.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 32),
            SvgPicture.asset(AppIcons.defaultProfile),
            Padding(
              padding: const EdgeInsets.only(top: 9, bottom: 12),
              child: Text(
                state.userData.nickname,
                style: AppTextStyles.titleTextStyle,
              ),
            ),
            Text(
              state.userData.email,
              style: AppTextStyles.defaultTextStyle.copyWith(color: AppColors.email),
            ),
          ],
        );
      },
    );
  }
}
