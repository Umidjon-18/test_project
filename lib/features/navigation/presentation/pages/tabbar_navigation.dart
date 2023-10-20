import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/assets/colors/app_colors.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:test_project/assets/constants/app_icons.dart';
import 'package:test_project/features/navigation/presentation/pages/default_page.dart';
import 'package:test_project/features/profile/presentation/pages/profile_page.dart';

class TabbarNavigation extends StatefulWidget {
  const TabbarNavigation({super.key});
  @override
  State<TabbarNavigation> createState() => _TabbarNavigationState();
}

class _TabbarNavigationState extends State<TabbarNavigation> {
  late List<Widget> pages = [
    const DefaultPage(title: 'Лента'),
    const DefaultPage(title: 'Карта'),
    const DefaultPage(title: 'Избранные'),
    const ProfilePage(),
  ];
  int currentIndex =0 ;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          activeColor: AppColors.primaryButton,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.lenta,color:currentIndex==0?AppColors.primaryButton:null),
              label: 'Лента',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.map,color:currentIndex==1?AppColors.primaryButton:null),
              label: 'Карта',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.favourite,color:currentIndex==2?AppColors.primaryButton:null),
              label: 'Избранные',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.profile,color:currentIndex==3?AppColors.primaryButton:null),
              label: 'Профиль',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return pages[index];
        },
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
