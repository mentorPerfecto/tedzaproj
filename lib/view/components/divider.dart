import 'package:flutter/material.dart';
import 'package:ecommerce/src/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/providers.dart';

class XampDivider extends ConsumerWidget {
  const XampDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeViewModel);
    var theme = Theme.of(context);
    return SizedBox(
      height: 1.5.h,
      width: double.infinity.w,
      child: Divider(
        color: theme.dividerColor,
        thickness: 1.5.h,
      ),
    );
  }
}
