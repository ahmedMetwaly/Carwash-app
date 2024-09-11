import 'package:carwashapp/core/constants/colors_manager.dart';
import 'package:carwashapp/features/home/presentation/pages/services_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/values.dart';
import 'home_page.dart';
import 'profile_page.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

List<Widget> screens = const [
  HomePage(),
  ServicesPage(),
  ProfileScreen(),
];
List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
    activeIcon: Icon(Icons.home),
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    activeIcon: Image.asset(
      'assets/images/repair_9358210.png',
      height: SizeManager.sIconSize,
      color: ColorsManager.primary,
    ),
    icon: Image.asset(
      'assets/images/repair_9358210.png',
      height: SizeManager.sIconSize,
    ),
    label: 'Services',
  ),
  const BottomNavigationBarItem(
    activeIcon: Icon(Icons.person),
    icon: Icon(Icons.person_outline_rounded),
    label: 'Profile',
  ),
];

int currentIndex = 0;
PageController controller = PageController(initialPage: currentIndex);

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
        final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SizeManager.radiusOfBNB),
            topRight: Radius.circular(SizeManager.radiusOfBNB),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).colorScheme.outline,
              offset: SizeManager.shadowOffsetBNB,
              spreadRadius: SizeManager.sSpace,
              blurRadius: SizeManager.elevationOfBNB,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SizeManager.radiusOfBNB),
            topRight: Radius.circular(SizeManager.radiusOfBNB),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: SizeManager.elevationOfBNB,
            // backgroundColor: primaryColor,
            selectedItemColor: primaryColor,
            items: items,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
      body: screens[currentIndex],
      // PageView(
      //   controller: controller,
      //   children: screens,
      //   onPageChanged: (value) => setState(
      //     () {
      //       currentIndex = value;
      //     },
      //   ),
      // ),
    );
  }
}
