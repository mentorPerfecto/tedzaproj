import 'package:flutter/material.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';

class BulletList extends StatelessWidget {
  const BulletList({super.key, required this.amenities});
  final List<dynamic>? amenities;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: amenities!.map<Widget>((propertyAmenty) {
          return SizedBox( height: 25.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: "\u2022",
                  fontSize: 16.spMin,
                  height: 1.5,
                  color: AppColors.kSubText,
                ),
                Gap(5.w),
                Expanded(
                  child: TextView(
                    text: propertyAmenty,
                    softRap: true,
                    fontSize: 15.spMin,
                    color: AppColors.kSubText,
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
