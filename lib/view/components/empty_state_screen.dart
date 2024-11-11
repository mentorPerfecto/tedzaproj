import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';


class EmptyListStateWidget extends ConsumerWidget {
  const EmptyListStateWidget({
    required this.stateDesc,
    this.height,
    this.width,
    this.widget,
    super.key,
  });
  final String stateDesc;
  final double? height;
  final double? width;
  final Widget? widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    final profileProvider = ref.watch(profileViewModel);
    return Container(
      alignment: Alignment.center,
      height: height ?? MediaQuery.of(context).size.height / 1.3,
      width: width ?? MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
          AppImages.emptyListIcon,
            width: 150.w,
            height: 150.h,
          ),
          TextView(
            text: stateDesc,
            color: theme.colorScheme.primary.withOpacity(.8),
            fontSize: 13.spMin,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            child: widget,
          )
        ],
      ),
    );
  }
}
