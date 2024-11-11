import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/config.dart';
import 'package:shimmer/shimmer.dart';


class CustomShimmerLoader extends ConsumerWidget {

  final double containerHeight;
  final double height;
  final int itemCount;

  const CustomShimmerLoader({super.key, required this.containerHeight, required this.height,
    required this.itemCount});


  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    return  Container(
      color: AppColors.kTransparent,
      height: height,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: itemCount ,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical:  4.0),
              child: Shimmer.fromColors(
                baseColor: AppColors.kGrey100,
                highlightColor:  AppColors.kGrey300,
                child: Container(
                  width:  360.w,
                  height: containerHeight,
                    decoration: BoxDecoration(borderRadius:
                    BorderRadius.circular(15.r),  color: Colors.green,)
                ),
              ),
            );
          }),
    );
  }
}
