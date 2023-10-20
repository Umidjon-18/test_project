import 'package:flutter/cupertino.dart';
import 'package:test_project/assets/colors/app_colors.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:test_project/assets/styles/text_style.dart';
import 'package:test_project/features/profile/presentation/widgets/logout_button.dart';
import 'package:test_project/features/profile/presentation/widgets/profile_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const KeyboardDismisser(
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          border: null,
          middle: Text('Профиль', style: AppTextStyles.navTitleTextStyle),
          backgroundColor: AppColors.white,
        ),
        backgroundColor: AppColors.pageBackground,
        child: Column(
          children: [
            ProfileInfo(),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}



