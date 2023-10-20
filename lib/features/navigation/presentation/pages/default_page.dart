import 'package:flutter/cupertino.dart';
import 'package:test_project/assets/colors/app_colors.dart';
import 'package:test_project/assets/styles/text_style.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        border: null,
        middle: Text(title, style: AppTextStyles.navTitleTextStyle),
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.pageBackground,
      child: Container(),
    );
  }
}
