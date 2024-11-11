// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';
import 'package:ecommerce/src/screens.dart';
import 'package:ecommerce/src/utils.dart';


class DashBoardScreen extends ConsumerStatefulWidget {

  final int? setIndex;

  const DashBoardScreen({super.key,  this.setIndex});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {

  @override
  void initState() {


   var profileProvider = ref.read(profileViewModel);
   var dashProvider = ref.read(dashboardViewModel);



   Future.microtask((){
     profileProvider.loadData(context);

   });
    super.initState();
  }

  @override
  void didChangeDependencies() {


    super.didChangeDependencies();
  }





  // int profileProvider.currentIndex = 0;
  List<Widget> dashboardPages = [
    const HomeScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var profileProvider = ref.watch(profileViewModel);
    var dashProvider = ref.watch(dashboardViewModel);
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        bool exit = await displayExitDialog(
          context,
          theme: theme,
          themeMode: themeMode,
        );
        return exit;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: dashboardPages[dashProvider.currentIndex],
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          useLegacyColorScheme: false,
          backgroundColor: theme.scaffoldBackgroundColor,
          selectedItemColor:
          themeMode == ThemeMode.light ? AppColors.kPrimary1 : AppColors.kPrimary150,
          unselectedItemColor: theme.colorScheme.secondary,
          selectedLabelStyle: TextStyle(
            fontFamily: ttHoves,
            fontSize: 10.spMin,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: ttHoves,
            fontSize: 10.spMin,
            fontWeight: FontWeight.w400,
          ),
          items: //write a ternary operator for the tenant,cause it should have only four navigation bar items.
          [
            BottomNavigationBarItem(
                icon: Image.asset(
                  dashProvider.currentIndex == 0
                      ? themeMode == ThemeMode.light
                      ? AppImages.selectedHome
                      : AppImages.selectedHomeDark
                      : AppImages.home,
                  width: 24.w,
                  height: 24.h,
                ),
                label: home),
            BottomNavigationBarItem(
                icon: Image.asset(
                  dashProvider.currentIndex == 1
                      ? themeMode == ThemeMode.light
                      ? AppImages.selectedMarket
                      : AppImages.selectedMarketPlaceDark
                      : AppImages.shop,
                  width: 24.w,
                  height: 24.h,
                ),
                label: marketPlace),
          ],
          onTap: (index) {
            dashProvider.setBottomBarItem(context, index);
          },
          currentIndex: dashProvider.currentIndex,
        ),
      ),
    );
  }
}
