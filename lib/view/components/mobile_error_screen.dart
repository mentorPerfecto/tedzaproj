import 'package:flutter/material.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';

class MobileErrorPage extends StatelessWidget {
  const MobileErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 600.h,
        width: 360.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.refresh_outlined,
              size: 130,
            ),
            Gap(10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: TextView(
                text:
                    'We seem to have run into a bit of a problem with this page, swipe down to reload.',
                textAlign: TextAlign.center,
                fontSize: 13.spMin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
