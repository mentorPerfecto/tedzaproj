import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void didChangeDependencies() {
    ref.watch(onboardingViewModel).checkUser(context);
    ref.watch(dashboardViewModel).getDeviceLocation();
    // ref.watch(themeViewModel).checkThemeMode();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeViewModel);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: Image.asset(
          AppImages.logo,
          width: 266.w,
          height: 258.h,
        ),
      ),
    );
  }
}
