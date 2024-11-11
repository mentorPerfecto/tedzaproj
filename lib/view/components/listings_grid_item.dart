// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/view/screens/dashboard/home/properties_full_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';
import 'package:ecommerce/src/utils.dart';
import 'package:ecommerce/src/screens.dart';

class ListingsGridItem extends ConsumerWidget {
  ListingsGridItem({
    super.key,
    required this.imageText,
    required this.price,
    required this.nameOfHouse,
    required this.houseAddress,
    required this.listingId,
    required this.category,
    this.loveIconOnTap,
    this.canTap = true,
  });

  final String imageText;
  final String price;
  final String nameOfHouse;
  final String houseAddress;
  final String listingId;
  final String category;
  final bool canTap;
  VoidCallback? loveIconOnTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    var profileProvider = ref.watch(profileViewModel);
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h, right: 6.w, left: 6.w),
      child: GestureDetector(
        onTap: () {
          navigatePush(
            context,
            PropertyFullDetailsScreen(
              id: listingId,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.kGrey300),
            borderRadius: BorderRadius.circular(10.r)
          ),
          height: 350.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),
                      topRight:  Radius.circular(10.r),),
                    color: AppColors.kGrey300,
                  ),

                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),
                          topRight:  Radius.circular(10.r),),
                        child: CachedNetworkImage(
                          // height: height,
                          width: 360.w,
                          imageUrl: imageText,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, __) =>  Container(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 5.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox( width:250.w,
                            child: TextView(
                              text:nameOfHouse,
                              // '${UtilFunctions.capitalizeAllWord()}',
                              fontSize: 13.spMin, maxLines: 3,
                              fontWeight: FontWeight.w600,
                              fontFamily: ttHoves,
                            ),
                          ),
                          InkWell(
                            onTap: loveIconOnTap,
                            child: CircleAvatar(
                              backgroundColor: AppColors.kWhite,
                              radius: 16.r,
                              child: Center(
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppColors.kPrimary1,
                                  size: 19.5.spMin,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox( width: 400.h,
                        child: TextView(
                          text: houseAddress,
                          maxLines: 2,
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kGrey,
                          fontFamily: ttHoves,
                        ),
                      ),
                      SizedBox(  height: 20.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text:
                              "${UtilFunctions.currency(context)} ${UtilFunctions.formatAmount(double.parse(price.toString()))}",
                              fontSize: 13.spMin,
                              fontWeight: FontWeight.w600,
                              fontFamily: ttHoves,
                            ),

                            TextView(
                              text: UtilFunctions.capitalizeAllWord(category),
                              fontSize: 12.spMin,
                              fontWeight: FontWeight.w400,
                              color: AppColors.kTextBlack,
                              fontFamily: ttHoves,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
